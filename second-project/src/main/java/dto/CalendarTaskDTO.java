package dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CalendarTaskDTO {
    private int empIdx;
    private String taskDate;
    private String taskDescription;

    public CalendarTaskDTO(int empIdx, String taskDate, String taskDescription) {
        this.empIdx = empIdx;
        this.taskDate = taskDate;
        this.taskDescription = taskDescription;
    }

}
