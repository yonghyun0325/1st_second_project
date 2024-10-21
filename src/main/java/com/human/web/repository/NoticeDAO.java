package com.human.web.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.human.web.vo.BoardVO;
import com.human.web.vo.BoardAttachedVO;

import lombok.AllArgsConstructor;
@Repository //DB와 관련된 작업을 하는 클래스에 붙여줌
@AllArgsConstructor
public class NoticeDAO {
	
	// lombok API를 이용한 의존 자동주입: 생성자 방식
	private SqlSession sqlSession;
	
	// MyBatis의 Mapper를 이용하기 위해 사용되는 상수 정의
	public static final String MAPPER = "com.human.web.mapper.NoticeMapper";

	// 트랜잭션 작업 관련 객체
	private PlatformTransactionManager transactionManager;

	//글목록 조회
	public List<BoardVO> getNoticeList(String searchField, String searchWord, int startNum) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchField", searchField);
        params.put("searchWord", searchWord);
        params.put("startNum", startNum);
		return sqlSession.selectList(MAPPER+".getBoardList", params);
	}

	//게시글 조회
	public BoardVO getNotice(int b_idx) {
		return sqlSession.selectOne(MAPPER+".getBoard", b_idx);
	}
	
	// 글 작성
	@Transactional
	public int insertNotice(BoardVO vo) throws RuntimeException{
		int result = 0;
		//트랜잭션을 처리할 수 있는 트랜잭션 상태 객체 정의
		TransactionStatus txStatus = 
				transactionManager.getTransaction(new DefaultTransactionDefinition());
		try {
			sqlSession.insert(MAPPER+".insertBoard", vo);
			//아직 공지사항 테이블에 입력값이 반영이 되지 않아서 nb_idx값이 생성되지 않은 상태이므로
			//기존에 저장된 공지사항 번호 중 최고값을 조회해서 1을 더해서 첨부파일의 nb_idx로 세팅함
			int b_idx = sqlSession.selectOne(MAPPER+".getMax_bidx");
			List<BoardAttachedVO> attachedList = vo.getAttachedList();
			for(BoardAttachedVO naVo : attachedList) {
				naVo.setB_idx(b_idx);
				sqlSession.insert(MAPPER+".insertAttached", naVo);
			}
			result = 1; //입력성공시 결과값
			
		} catch (Exception e) {
			System.out.println("(BoardDAO.java) 글 작성중 예외 발생");
			transactionManager.rollback(txStatus);
			throw e;
		}
		transactionManager.commit(txStatus);
		return result;
	}

	// 조회수 업데이트
	public void updateReadCount(int b_idx) {
		sqlSession.update(MAPPER+".updateReadCount", b_idx);
		
	}

	// 글 수정
	public int updateNotice(BoardVO vo) {
		return sqlSession.update(MAPPER+".updateBoard",vo);
	}

    // 글 삭제
	public int deleteNotice(int b_idx) {
		return sqlSession.update(MAPPER+".deleteBoard", b_idx);
	}
    
	// 첨부파일 삭제
	public int deleteAttached(int na_idx) {
		return sqlSession.delete(MAPPER+".deleteAttached", na_idx);
	}
}
