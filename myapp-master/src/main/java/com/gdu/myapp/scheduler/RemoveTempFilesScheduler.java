package com.gdu.myapp.scheduler;

import org.springframework.scheduling.annotation.Scheduled;

public class RemoveTempFilesScheduler {

  /*@Autowired
  private UploadService uploadService;*/

  @Scheduled(cron="0 28 12 * * ?")
  public void execute() {
    //uploadService.removeTempFiles();
  }

}
