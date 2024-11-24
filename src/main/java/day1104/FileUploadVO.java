package day1104;

public class FileUploadVO {

	private String profile, name, id;

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "FileUploadVO [profile=" + profile + ", name=" + name + ", id=" + id + "]";
	}

}
