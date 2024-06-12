package com.gdu.myapp.service;

import java.io.File;
import java.io.PrintWriter;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.mapper.EmpMapper;
import com.gdu.myapp.utils.MyFileUtils;
import com.gdu.myapp.utils.MySecurityUtils;
import com.gdu.myapp.utils.MyUsefulUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MyPageServiceImpl implements MyPageService {
	
	private final EmpMapper empMapper;
	private final MyFileUtils myFileUtils;
	
	@Override
	  public EmpDto getEmpDetail(String empCode) {
	    return empMapper.getEmpDetail(empCode);
	  }
	
	@Override
	public int modifyInfo(HttpServletRequest request) {
		String empCode = request.getParameter("empCode");
		String phone = request.getParameter("phone");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		int zipCode = Integer.parseInt(request.getParameter("zipCode"));
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		
		EmpDto emp = EmpDto.builder()
			.empCode(empCode)
			.phone(phone)
			.mobile(mobile)
			.email(email)
			.zipCode(zipCode)
			.address(address)
			.detailAddress(detailAddress)
			.build();					
		
		int result = empMapper.updateInfo(emp);
		
		return result;
	}
	
	
	
	@Override
	public boolean modifyProfile(MultipartHttpServletRequest multipartHttpServletRequest) {
        MultipartFile multipartFile = multipartHttpServletRequest.getFile("profilePhoto");
		
        if(multipartFile == null) {
            return false;
        }
        
        String uploadPath = myFileUtils.getUploadPath();
        File dir = new File(uploadPath);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        
        String originalFileName = multipartFile.getOriginalFilename();
        String fileSystemName = myFileUtils.getFilesystemName(originalFileName);
        File file = new File(dir, fileSystemName);
        
        try {
            multipartFile.transferTo(file);
            
            empMapper.updateProfile(
                        Map.of("uploadPath", uploadPath + "/" + fileSystemName, 
                               "userNo", multipartHttpServletRequest.getParameter("userNo"))
                    );
        } catch(Exception e) {
            e.printStackTrace();
            return false;
        }

        HttpSession session = multipartHttpServletRequest.getSession();
        EmpDto emp = (EmpDto) session.getAttribute("emp");
        emp.setProfileFileName(uploadPath + "/" + fileSystemName);
        session.setAttribute("emp", emp);
        
        return true;
	}
	
	 @Override
	    public void modifyPassword(HttpServletRequest request, HttpServletResponse response) {

	        String empCode = MySecurityUtils.getPreventXss(request.getParameter("empCode"));
	        String password = MySecurityUtils.getSha256(request.getParameter("password"));

	        EmpDto emp = EmpDto.builder()
	        				.empCode(empCode)
	        				.password(password)
	        				.build();
	        PrintWriter out = null;

	        try {
	            out = response.getWriter();
	            response.setContentType("text/html; charset=UTF-8");

	            int updateCount = empMapper.updatePassword(emp);
	            if (updateCount == 1)
	                out.println(
	                        MyUsefulUtils.locationHref("비밀번호 변경성공하였습니다.", request.getContextPath() + MyUsefulUtils.MY_INFO + empCode)
	                );
	        } catch (Exception e) {
	            out.println(MyUsefulUtils.locationHref("비밀번호 변경실패하였습니다.", request.getContextPath() + MyUsefulUtils.MY_INFO + empCode));
	            e.printStackTrace();
	        } finally {
	            out.flush();
	            out.close();
	        }
	    }
	
}
