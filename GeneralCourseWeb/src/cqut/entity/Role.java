package cqut.entity;

public class Role {
	private Integer roleId;
	private String name;

	public Role() {
		super();
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Role(Integer roleId, String name) {
		super();
		this.roleId = roleId;
		this.name = name;
	}
	
}
