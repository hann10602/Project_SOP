package com.laptrinhjavaweb.Service;

import java.util.List;

import com.laptrinhjavaweb.model.ReportCommentModel;

public interface IReportCommentService {
	List<ReportCommentModel> findAll();
	ReportCommentModel findOne(int id);
	ReportCommentModel save(ReportCommentModel reportComment);
	Integer[] delete(ReportCommentModel reportComment);
}
