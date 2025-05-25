package iostar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderModel implements Serializable {
    private int id;
    private int userId;
    private String status;
    private float totalPrice;
    private String paymentMethod;
    private String address;
    
    private List<OrderDetailModel> orderDetails;

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<OrderDetailModel> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetailModel> orderDetails) {
		this.orderDetails = orderDetails;
	}
    
    
}
