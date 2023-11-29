package hicinema.community.vo;

public class Communitygetset {
	int postno;
	String tab;
	String posttitle;
	String post;
	String file1;
	String file2;
	String file3;
	String file4;
	String file5;
	String id;
	int viewed;
	String writtendate;
	int recommend;
	public int getPostno() {
		return postno;
	}
	public void setPostno(int postno) {
		this.postno = postno;
	}
	public String getTab() {
		return tab;
	}
	public void setTab(String tab) {
		this.tab = tab;
	}
	public String getPosttitle() {
		return posttitle;
	}
	public void setPosttitle(String posttitle) {
		this.posttitle = posttitle;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	

	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	public String getFile3() {
		return file3;
	}
	public void setFile3(String file3) {
		this.file3 = file3;
	}
	public String getFile4() {
		return file4;
	}
	public void setFile4(String file4) {
		this.file4 = file4;
	}
	public String getFile5() {
		return file5;
	}
	public void setFile5(String file5) {
		this.file5 = file5;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getViewed() {
		return viewed;
	}
	public void setViewed(int viewed) {
		this.viewed = viewed;
	}
	public String getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(String writtendate) {
		this.writtendate = writtendate;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	
	 public void setFile(String paramName, String fileName) {
	        switch (paramName) {
	            case "file1":
	                setFile1(fileName);
	                break;
	            case "file2":
	                setFile2(fileName);
	                break;
	            case "file3":
	                setFile3(fileName);
	                break;
	            case "file4":
	                setFile4(fileName);
	                break;
	            case "file5":
	                setFile5(fileName);
	                break;
	            default:
	             
	                break;
	        }
	    }
	
}
