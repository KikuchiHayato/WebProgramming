package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDao {

    public User findByLoginInfo(String loginId, String password) {
        Connection conn = null;
        try {
            conn = DBManager.getConnection();

            String sql = "SELECT * FROM user WHERE login_id = ? and password = ?";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, loginId);
            pStmt.setString(2, password);
            ResultSet rs = pStmt.executeQuery();

            if (!rs.next()) {
                return null;
            }

            int idDate = rs.getInt("id");
            String loginIdData = rs.getString("login_id");
            String nameData = rs.getString("name");
            return new User(idDate,loginIdData, nameData);

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
    }

    public User findByUserInfo(String id) {
        Connection conn = null;
        try {
            conn = DBManager.getConnection();

            String sql = "SELECT * FROM user WHERE id = ?";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, id);
            ResultSet rs = pStmt.executeQuery();

            if (!rs.next()) {
                return null;
            }

            int idDate = rs.getInt("id");
            String loginIdData = rs.getString("login_id");
            String nameData = rs.getString("name");
            Date birthDate = rs.getDate("birth_date");
            String RegisteredDate = rs.getString("create_date");
            String ModifiedData = rs.getString("update_date");
            return new User(idDate,loginIdData, nameData,birthDate,RegisteredDate,ModifiedData);

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
    }

	public boolean findBySignUpInfo(String loginId, String password, String name, String birthDate) {
		Connection conn = null;
        try {
            conn = DBManager.getConnection();

            String sql = "INSERT INTO user (login_id, password, name, birth_date, create_date, update_date) VALUES (?,?,?,?, now(), now() )";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, loginId);
            pStmt.setString(2, password);
            pStmt.setString(3, name);
            pStmt.setString(4, birthDate);
            pStmt.executeUpdate();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return false;
                }
            }
        }
	}

	public String findBySignUpinfo(String loginId) {
		Connection conn = null;
        try {
        	conn = DBManager.getConnection();

            String sql = "SELECT * FROM user WHERE login_id = ?";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, loginId);
            ResultSet rs = pStmt.executeQuery();

            if (!rs.next()) {
                return null;
            }

            String loginIdData = rs.getString("login_id");
            return new String(loginIdData);

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
	}

	public boolean findByUserUpdateInfo(String id, String password, String name, String birthDate) {
		Connection conn = null;
        try {
            conn = DBManager.getConnection();

            String sql = "UPDATE user SET password = ?, name = ?, birth_date = ?, update_date = now() WHERE id = ?";

            PreparedStatement pStmt = conn.prepareStatement(sql);

            if (password.equals("")) {
            	sql = "UPDATE user SET name = ?, birth_date = ?, update_date = now() WHERE id = ?";
            	pStmt = conn.prepareStatement(sql);

            	pStmt.setString(1, name);
                pStmt.setString(2, birthDate);
                pStmt.setString(3, id);
                pStmt.executeUpdate();
            } else {
            	pStmt.setString(1, password);
                pStmt.setString(2, name);
                pStmt.setString(3, birthDate);
                pStmt.setString(4, id);
                pStmt.executeUpdate();
            }

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return false;
                }
            }
        }
	}

	public boolean findByUserDeleteInfo(String id) {
		Connection conn = null;
        try {
            conn = DBManager.getConnection();

            String sql = "DELETE FROM user WHERE id = ?";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, id);
            pStmt.executeUpdate();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return false;
                }
            }
        }
	}

    public List<User> findSearch(String loginId, String name,String birthdate) {
    	Connection conn = null;
        List<User> userList = new ArrayList<User>();

        try {
            conn = DBManager.getConnection();

            String sql = "SELECT * FROM user WHERE id != '1'";

            if (!loginId.equals("")) {
            	sql += " and login_id = '" + loginId + "'";
            }

            if (!name.equals("")) {
            	sql += " and name LIKE '%" + name + "%'";
            }

            if (!birthdate.equals("")) {
            	sql += " and birth_date = '" + birthdate + "'";
            }

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
            	int id = rs.getInt("id");
                loginId = rs.getString("login_id");
                name = rs.getString("name");
                Date birthDate = rs.getDate("birth_date");
                String password = rs.getString("password");
                String createDate = rs.getString("create_date");
                String updateDate = rs.getString("update_date");
                User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

                userList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
		return userList;
    }

    public List<User> findAll() {
        Connection conn = null;
        List<User> userList = new ArrayList<User>();

        try {
            conn = DBManager.getConnection();

            String sql = "SELECT * FROM user WHERE id != '1'";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String loginId = rs.getString("login_id");
                String name = rs.getString("name");
                Date birthDate = rs.getDate("birth_date");
                String password = rs.getString("password");
                String createDate = rs.getString("create_date");
                String updateDate = rs.getString("update_date");
                User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
        return userList;
    }

}

