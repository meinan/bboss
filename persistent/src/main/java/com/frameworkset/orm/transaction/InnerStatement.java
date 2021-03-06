﻿/*
 *  Copyright 2008 biaoping.yin
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.  
 */
package com.frameworkset.orm.transaction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * 
 * <p>Title: InnerStatement.java</p>
 *
 * <p>Description: </p>
 *
 * <p>
 * bboss workgroup
 * </p>
 * <p>
 * Copyright (c) 2007
 * </p>
 * 
 * @Date 2009-6-1 下午08:58:51
 * @author biaoping.yin
 * @version 1.0
 */
class InnerStatement implements Statement {
	protected boolean closed = false;
	Statement stmt;
	protected List results = new ArrayList();

	public InnerStatement(Statement stmt) {
		this.stmt = stmt;
	}

	public void addBatch(String sql) throws SQLException {
		this.stmt.addBatch(sql);

	}

	public void cancel() throws SQLException {
		this.stmt.cancel();

	}

	public void clearBatch() throws SQLException {
		this.stmt.cancel();

	}

	public void clearWarnings() throws SQLException {
		this.stmt.clearWarnings();

	}

	private void closeResults()
	{
		try
		{
			for(int i = 0; i < results.size(); i ++)
			{
				ResultSet rs = (ResultSet)results.get(i);	
				try {
					rs.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
			results.clear();
		}
		catch(Exception e )
		{
			
		}
		
	}
	public void close() throws SQLException {
		if(closed)
			return ;
		closed = true;
		closeResults();
		this.stmt.close();

	}

	public boolean execute(String sql) throws SQLException {

		return this.stmt.execute(sql);
	}

	public boolean execute(String sql, int autoGeneratedKeys)
			throws SQLException {

		return this.stmt.execute(sql, autoGeneratedKeys);
	}

	public boolean execute(String sql, int[] columnIndexes) throws SQLException {

		return this.stmt.execute(sql, columnIndexes);
	}

	public boolean execute(String sql, String[] columnNames)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.execute(sql, columnNames);
	}

	public int[] executeBatch() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.executeBatch();
	}

	public ResultSet executeQuery(String sql) throws SQLException {
		ResultSet rs = this.stmt.executeQuery(sql);
		this.results.add(rs);
		return rs;
	}

	public int executeUpdate(String sql) throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.executeUpdate(sql);
	}

	public int executeUpdate(String sql, int autoGeneratedKeys)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.executeUpdate(sql, autoGeneratedKeys);
	}

	public int executeUpdate(String sql, int[] columnIndexes)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.executeUpdate(sql, columnIndexes);
	}

	public int executeUpdate(String sql, String[] columnNames)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.executeUpdate(sql, columnNames);
	}

	public Connection getConnection() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getConnection();
	}

	public int getFetchDirection() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getFetchDirection();
	}

	public int getFetchSize() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getFetchSize();
	}

	public ResultSet getGeneratedKeys() throws SQLException {
		ResultSet rs = this.stmt.getGeneratedKeys();
		this.results.add(rs);
		return rs;
//		return this.stmt.getGeneratedKeys();
	}

	public int getMaxFieldSize() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getMaxFieldSize();
	}

	public int getMaxRows() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getMaxRows();
	}

	public boolean getMoreResults() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getMoreResults();
	}

	public boolean getMoreResults(int current) throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getMoreResults(current);
	}

	public int getQueryTimeout() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getQueryTimeout();
	}

	public ResultSet getResultSet() throws SQLException {
		ResultSet rs = this.stmt.getResultSet();
		this.results.add(rs);
		return rs;
//		return this.stmt.getResultSet();
	}

	public int getResultSetConcurrency() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getResultSetConcurrency();
	}

	public int getResultSetHoldability() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getResultSetHoldability();
	}

	public int getResultSetType() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getResultSetType();
	}

	public int getUpdateCount() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getUpdateCount();
	}

	public SQLWarning getWarnings() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.getWarnings();
	}

	public void setCursorName(String name) throws SQLException {
		this.stmt.setCursorName(name);

	}

	public void setEscapeProcessing(boolean enable) throws SQLException {
		this.stmt.setEscapeProcessing(enable);

	}

	public void setFetchDirection(int direction) throws SQLException {
		this.stmt.setFetchDirection(direction);

	}

	public void setFetchSize(int rows) throws SQLException {
		this.stmt.setFetchSize(rows);

	}

	public void setMaxFieldSize(int max) throws SQLException {
		this.stmt.setMaxFieldSize(max);

	}

	public void setMaxRows(int max) throws SQLException {
		this.stmt.setMaxRows(max);

	}

	public void setQueryTimeout(int seconds) throws SQLException {
		this.stmt.setQueryTimeout(seconds);

	}

	public <T> T unwrap(Class<T> iface) throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.unwrap(iface);
	}

	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.isWrapperFor(iface);
	}

	public boolean isClosed() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.isClosed();
	}

	public void setPoolable(boolean poolable) throws SQLException {
		// TODO Auto-generated method stub
		this.stmt.setPoolable(poolable);
	}

	public boolean isPoolable() throws SQLException {
		// TODO Auto-generated method stub
		return this.stmt.isPoolable();
	}
}