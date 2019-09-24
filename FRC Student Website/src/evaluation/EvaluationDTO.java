package evaluation;

public class EvaluationDTO {
	
	int evaluationID;

	String userID;

	String courseName;

	String teacherName;

	int courseYear;

	String semesterDivide;

	String gradeDivide;

	String evaluationTitle;

	String evaluationContent;

	String totalScore;

	String useful;

	String interesting;

	String easy;

	int likeCount;

	public int getEvaluationID() {
		return evaluationID;
	}

	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public int getCourseYear() {
		return courseYear;
	}

	public void setCourseYear(int courseYear) {
		this.courseYear = courseYear;
	}

	public String getSemesterDivide() {
		return semesterDivide;
	}

	public void setSemesterDivide(String semesterDivide) {
		this.semesterDivide = semesterDivide;
	}

	public String getGradeDivide() {
		return gradeDivide;
	}

	public void setGradeDivide(String gradeDivide) {
		this.gradeDivide = gradeDivide;
	}

	public String getEvaluationTitle() {
		return evaluationTitle;
	}

	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}

	public String getEvaluationContent() {
		return evaluationContent;
	}

	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}

	public String getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}

	public String getUseful() {
		return useful;
	}

	public void setUseful(String useful) {
		this.useful = useful;
	}

	public String getInteresting() {
		return interesting;
	}

	public void setInteresting(String interesting) {
		this.interesting = interesting;
	}

	public String getEasy() {
		return easy;
	}

	public void setEasy(String easy) {
		this.easy = easy;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public EvaluationDTO() {
		
	}
	
	public EvaluationDTO(int evaluationID, String userID, String courseName, String teacherName, int courseYear,
			String semesterDivide, String gradeDivide, String evaluationTitle, String evaluationContent,
			String totalScore, String useful, String interesting, String easy, int likeCount) {
		this.evaluationID = evaluationID;
		this.userID = userID;
		this.courseName = courseName;
		this.teacherName = teacherName;
		this.courseYear = courseYear;
		this.semesterDivide = semesterDivide;
		this.gradeDivide = gradeDivide;
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.totalScore = totalScore;
		this.useful = useful;
		this.interesting = interesting;
		this.easy = easy;
		this.likeCount = likeCount;
	}
	
	

}
