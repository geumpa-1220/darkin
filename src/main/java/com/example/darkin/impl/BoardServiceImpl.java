package com.example.darkin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.darkin.dto.AnswerDto;
import com.example.darkin.dto.QuestionDto;
import com.example.darkin.mapper.BoardMapper;
import com.example.darkin.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;
	
	
	@Override
	public List<QuestionDto> questionList()
	{
	    return boardMapper.questionList();
	}
	
	
	@Override
	public void writeQuestion(QuestionDto questionDto)
	{	
		boardMapper.insertQuestion(questionDto);	
	}
	
	
	@Override
	public QuestionDto questionBoard(int id)
	{
		return boardMapper.questionBoard(id);
	}
	
	@Override
	public void writeAnswer(AnswerDto answerDto)
	{
		boardMapper.writeAnswer(answerDto);
	}

	@Override
	public List<AnswerDto> answerList(int id)
	{
		return boardMapper.answerList(id);
	}
	
}








