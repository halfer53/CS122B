package movie.work.service;

import java.util.List;

import movie.work.dao.AdminDAO;
import movie.work.entity.Employee;
import movie.work.entity.Metadata;
import movie.work.entity.Star;

public class AdminService {
	AdminDAO adminDAO;

	public AdminService() {
		adminDAO = new AdminDAO();
	}

	public Employee getEmployee(String fullname, String password) {
		return adminDAO.getEmployee(fullname, password);
	}

	public boolean addStar(Star star) {
		return adminDAO.addStar(star);
	}
	
	public List<Metadata> getDatabaseSchema() {
		return adminDAO.getDatabaseSchema();
	}
	
	public String addMovie(String first_name, String last_name, String genre_name, String title, int year, String director) {
		return adminDAO.addMovie(first_name, last_name, genre_name, title, year, director);
	}
}
