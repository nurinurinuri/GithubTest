package com.spring.lessondao;

import java.util.List;

import com.spring.lessonvo.LessonVO;

public interface LessonMapper {
	public List<LessonVO> listLesson(LessonVO param);
	public LessonVO selectLesson(int no);
	public int insertLesson(LessonVO param);
	public int updateLesson(LessonVO param);
	public int deleteLesson(int no);
}
