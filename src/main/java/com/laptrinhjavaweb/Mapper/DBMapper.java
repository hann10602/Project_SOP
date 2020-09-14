package com.laptrinhjavaweb.Mapper;

import java.sql.ResultSet;

public interface DBMapper<T> {
	T mapRow(ResultSet rs);
}
