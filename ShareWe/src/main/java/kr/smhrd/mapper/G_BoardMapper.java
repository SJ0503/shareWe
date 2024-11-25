package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.g_board;

@Mapper
public interface G_BoardMapper {

	public int insertBoard(g_board g_board);

	public List<g_board> getGBoard();

	public List<g_board> getgCategory(String category);

	public List<g_board> getGEmail(String email);

	public g_board G_BoardContent(int g_num);

	public List<g_board> getG_num(int g_num);
	
	public void gParticipate(int g_num);

	public void deleteRep(String param1, int param2);

	public void gBoardUp(int g_num);

	public void deleteGBoard(int g_num);

	public void gBoardUpdate(g_board g_board);

	public void endGBoard(int g_num);

	public void restartGBoard(int g_num);
	
}
