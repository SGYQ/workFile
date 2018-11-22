package com.mk.json;

public class Employee
{
	private int id;
	private String name; //name,gender,email,tel,address
	private int gender;
	private String email;
	private String tel;
	private String address;

	public Employee()
	{
		// TODO Auto-generated constructor stub
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getGender()
	{
		return gender;
	}

	public void setGender(int gender)
	{
		this.gender = gender;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	@Override
	public String toString()
	{
		return "Employee [id=" + id + ", name=" + name + ", gender=" + gender + ", email=" + email + ", tel=" + tel
				+ ", address=" + address + "]";
	}
	
	
}
