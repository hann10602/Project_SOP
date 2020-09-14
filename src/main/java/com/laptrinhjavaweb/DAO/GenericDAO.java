package com.laptrinhjavaweb.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.laptrinhjavaweb.Mapper.DBMapper;

public interface GenericDAO<T> {
	Connection openConnection();
	void closeConncettion(Connection conn, PreparedStatement ps, ResultSet rs);
	void setParameters(PreparedStatement ps, Object... parametters);
	T query(String sql,DBMapper<T> mapper,Object... parametters);
	List<T> queryList(String sql,DBMapper<T> mapper,Object... parametters);
}
