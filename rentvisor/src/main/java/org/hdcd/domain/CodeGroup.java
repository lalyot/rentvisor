package org.hdcd.domain;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CodeGroup {

	@NotBlank
	private String groupCode;
	
	@NotBlank
	private String groupName;
	
	private String useYn;
	private LocalDateTime regDate;
	private LocalDateTime updDate;

}
