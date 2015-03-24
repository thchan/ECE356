package ece356_project;

public class WorkAddress {
    int location_id;
	String address;
	String city;
	String province;
	String postal_code;
	
	public WorkAddress(int location_id, String address, String city, String province, String postal_code)
	{
		this.location_id = location_id;
		this.address = address;
		this.city = city;
		this.province = province;
		this.postal_code = postal_code;
	}
        public String getAddress()
        {
                String ret = this.address + ", " + this.city + ", " + this.province + ", " + this.postal_code;
                return ret;
        }
}
