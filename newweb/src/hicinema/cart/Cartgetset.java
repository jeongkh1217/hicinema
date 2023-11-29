package hicinema.cart;

import java.sql.Timestamp;

public class Cartgetset {
String id;
String itemid;
int quantity;
String purchased;
String purchaseid;
String payby;


public String getPurchased() {
	return purchased;
}
public void setPurchased(String purchased) {
	this.purchased = purchased;
}
public String getPurchaseid() {
	return purchaseid;
}
public void setPurchaseid(String purchaseid) {
	this.purchaseid = purchaseid;
}
public String getPayby() {
	return payby;
}
public void setPayby(String payby) {
	this.payby = payby;
}
public Timestamp getPaydate() {
	return paydate;
}
public void setPaydate(Timestamp paydate) {
	this.paydate = paydate;
}
Timestamp paydate;

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getItemid() {
	return itemid;
}
public void setItemid(String itemid) {
	this.itemid = itemid;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}

}
