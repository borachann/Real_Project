package com.kosign.wecafe.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="wecafe_order")
public class Order implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(allocationSize=1, initialValue=1, sequenceName="order_order_id_seq", name="order_id")
	@GeneratedValue(generator="order_id", strategy=GenerationType.SEQUENCE)
	@Column(name="order_id")
	private long orderId;
		
	@ManyToMany(mappedBy="order")
	private Set<OrderDetail> orderDetail = new HashSet<OrderDetail>();
	
	
	@Column(name="order_Date")
	private Date orderDate;
	
	@Column(name="cus_id")
	private long cusId;

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public long getCusId() {
		return cusId;
	}

	public void setCusId(long cusId) {
		this.cusId = cusId;
	}

	/*@OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.order",cascade=CascadeType.ALL)*/
	public Set<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Set<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}
	
}