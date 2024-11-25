package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.c_board;
import kr.smhrd.entity.g_board;

@Mapper
public interface SearchMapper {

	public List<g_board> gSearch(String searchText);
	
	public List<c_board> cSearch(String searchText);

}
