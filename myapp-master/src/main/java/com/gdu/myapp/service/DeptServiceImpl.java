package com.gdu.myapp.service;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.gdu.myapp.dto.DeptDto;
import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.mapper.DeptMapper;
import com.gdu.myapp.utils.MyPageUtils;
import com.gdu.myapp.utils.MySecurityUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Transactional
@Service
public class DeptServiceImpl implements DeptService {

	private final DeptMapper deptMapper;
	private final MyPageUtils myPageUtils;
	
	public DeptServiceImpl(DeptMapper deptMapper, MyPageUtils myPageUtils) {
		this.deptMapper = deptMapper;
		this.myPageUtils = myPageUtils;
	}
	
	@Override
	public List<DeptDto> getDeptList(String deptCode) {
		
		return deptMapper.getDeptList(deptCode);
	}

	@Override
	public List<EmpDto> getBelongEmpList(String deptCode) {
		
		return deptMapper.getBelongEmpList(deptCode);
	}
	
	@Override
	public void getDeptListForManage(HttpServletRequest request, Model model) {
	  
	  int total = deptMapper.getDeptCount();
    int display = 10;
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    myPageUtils.setPaging(total, display, page);
    
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd());
    
    List<DeptDto> deptList = deptMapper.getDeptListForManage(map);
    
    // 목록 화면으로 반환할 값 (목록 + 전체 페이지 수)
    model.addAttribute("beginNo", total - (page - 1) * display);
    model.addAttribute("deptList", deptList);
    model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/admin/dept/list.do", null, display));
    
	}
	
	@Override
	public DeptDto getDeptDetail(String deptCode) {
	  return deptMapper.getDeptDetail(deptCode);
	}
	
	@Override
	public void registerDept(HttpServletRequest request, HttpServletResponse response) {
	  
	  String deptCode = request.getParameter("deptCode");
	  String deptName = MySecurityUtils.getPreventXss(request.getParameter("deptName"));
	  String deptUpstairCode = request.getParameter("deptUpstairCode");
	  String deptLocation = request.getParameter("deptLocation");
	  String deptCreateDate = request.getParameter("deptCreateDate");
	  String deptLeaderEmpCode = request.getParameter("deptLeaderEmpCode");
	  String deptLevel = request.getParameter("deptLevel");
	  
	  DeptDto dept = DeptDto.builder()
	                    .deptCode(deptCode)
	                    .deptName(deptName)
	                    .deptUpstairCode(deptUpstairCode)
	                    .deptLocation(deptLocation)
	                    .deptCreatedate(LocalDate.parse(deptCreateDate))
	                    .deptLeaderEmpCode(deptLeaderEmpCode)
	                    .deptLevel(Integer.parseInt(deptLevel))
	                  .build();
	  
	  int insertCount = deptMapper.insertDept(dept);
	  
	  try {
	    
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.println("<script>");
	    
	    // 등록 성공
	    if(insertCount == 1) {
	      
	      out.println("alert('부서가 등록되었습니다.');");
	      out.println("location.href='" + request.getContextPath() + "/admin/dept/management.page';");
	      
	      // 등록 실패
	    } else {
	      out.println("alert('부서 등록이 실패했습니다.');");
	      out.println("history.back();");
	    }
	    out.println("</script>");
	    out.flush();
	    out.close();
	    
	  } catch (Exception e) {
	    e.printStackTrace();
	  }
	}
	
	@Override
	public List<EmpDto> getDeptMember(String deptCode) {
	  return deptMapper.getDeptMember(deptCode);
	}
	
	@Override
	public void modifyDeptLeader(HttpServletRequest request) {
	  
	  try {
      
	    String deptCode = request.getParameter("deptCode");
	    String empCode = request.getParameter("modifyEmpCode");
	    
	    DeptDto dept = DeptDto.builder()
	        .deptCode(deptCode)
	        .empCode(empCode)
	        .build();
	    
	    deptMapper.appointDeptLeader(dept);
	    
    } catch (Exception e) {
      e.printStackTrace();
    }
	}
	
	@Override
	public List<DeptDto> getDeptListForTransfer(String deptCode) {
	  return deptMapper.getDeptListForTransfer(deptCode);
	}
	
	@Override
	public int modifyDeptInfo(HttpServletRequest request) {
	  
	  String deptCode = request.getParameter("deptCode");
	  String deptName = request.getParameter("deptName");
	  int deptLevel = Integer.parseInt(request.getParameter("deptLevel"));
	  String deptLocation = request.getParameter("deptLocation");
	  char useYn = (request.getParameter("useYn").equals("Y")) ? 'Y' : 'N';
	  String deptUpstairCode = request.getParameter("deptUpstairCode");
	  
	  DeptDto dept = DeptDto.builder()
	                    .deptCode(deptCode)
	                    .deptName(deptName)
	                    .deptLevel(deptLevel)
	                    .deptLocation(deptLocation)
	                    .useYn(useYn)
	                    .deptUpstairCode(deptUpstairCode)
	                  .build();
	  
	  int modifyCount = deptMapper.updateDeptInfo(dept);
	  
	  return modifyCount;
	}
	
}
