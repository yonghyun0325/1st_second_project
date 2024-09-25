package dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class LoginDTO {
	
	private int e_Idx;
	private String e_name;
	private String e_pw;
	
	public LoginDTO(int empIdx, String empName, String empPw) {
		this.e_Idx = empIdx;
		this.e_name = empName;
		this.e_pw = empPw;
	}
}
