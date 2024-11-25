package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.smhrd.entity.report;

@Mapper
public interface ReportMapper {

	public void sendReportInfo();
	
	public void reportInsert(report report);

	public void passRep(String email, int b_num);


	


}
