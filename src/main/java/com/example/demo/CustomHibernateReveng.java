package com.example.demo;

import org.hibernate.cfg.reveng.DefaultReverseEngineeringStrategy;
import org.hibernate.cfg.reveng.ReverseEngineeringStrategy;
import org.hibernate.cfg.reveng.TableIdentifier;

public class CustomHibernateReveng extends DefaultReverseEngineeringStrategy{

	public CustomHibernateReveng(ReverseEngineeringStrategy rootStrategy) {
		super();
	}

	@Override
	public String getTableIdentifierStrategyName(TableIdentifier t) {
		String configuredName = super.getTableIdentifierStrategyName(t);
		if (configuredName == null) {
			configuredName = "assigned";
			System.out.println("Used default strategy of " + configuredName);
		} else {
			System.out.println("Used configured strategy of " + configuredName);
		}
		return configuredName;
	}

}
