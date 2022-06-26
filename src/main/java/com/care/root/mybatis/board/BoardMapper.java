package com.care.root.mybatis.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.BoardDTO;
import com.care.root.board.dto.BoardRepDTO;

public interface BoardMapper {
	public List<BoardDTO> boardAllList(@Param("s")int start, @Param("e")int end);
	public int writeSave(BoardDTO dto);
	public BoardDTO contentView(int writeNo);
	public int delete(int writeNo);
	public int update(BoardDTO dto);
	public void upHit(int writeNo);
	public void addReply(BoardRepDTO dto);
	public List<BoardRepDTO> getRepList(int write_group);
	public int selectBoardCount();
}
