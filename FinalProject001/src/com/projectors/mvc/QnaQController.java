/*==================================
 	QnaQController.java
 - mybatis 객체 활용/ 문의 컨트롤러 
===================================*/
package com.projectors.mvc;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnaQController
{
	@Autowired   
	private SqlSession sqlSession;
	
	// 문의글 인서트 (QnAQInsert.jsp) 
	@RequestMapping(value="/question-insert-form.action", method = RequestMethod.GET )
	public String qnaQInsert(QnaQDTO dto)
	{
		String result = "";
		
		IqnaQDAO dao = sqlSession.getMapper(IqnaQDAO.class);
		dao.insert(dto);
		
		result ="QnAArticle.jsp";
		return result; 
	}
	
	// 나의 질문 리스트 출력 (QnALists.jsp) 
	@RequestMapping(value="/question-list.action", method = RequestMethod.GET)
	public String questionList(Model model)
	{	
		String result = "";
		IqnaQDAO dao = sqlSession.getMapper(IqnaQDAO.class);	
	
		model.addAttribute("questionList", dao.getQuestionList());
		/* result = "/WEB-INF/view/MyQuestionLists.jsp"; */
		result = "QnALists.jsp";
		return result; 
	}
	
	// 특정 질문글 출력 (QnAArticle.jsp)
	@RequestMapping(value="/question-article.action", method = RequestMethod.GET)
	public String questionArticle(Model model)
	{	
		String result = "";
		IqnaQDAO dao = sqlSession.getMapper(IqnaQDAO.class);	
	
		model.addAttribute("questionArticle", dao.viewQuestionDetail());
		
		/* result = "/WEB-INF/view/QnAArticle.jsp"; */
		result = "QnAArticle.jsp";
		return result; 
	}
}