package org.hdcd.common.domain;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginLog {

	private Long userNo;
	
	private String userId;
	private String remoteAddr;
	
	private LocalDateTime regDate;
	private LocalDateTime updDate;

}
