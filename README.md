# Capstone-project
Telecom churn data analysis using Power BI, SQL, Python
![Image](https://github.com/user-attachments/assets/43ab8e48-3455-4aa1-887b-0077cca01f42)



# What is Customer Churn?
Customer churn is defined as when customers or subscribers discontinue doing business with a firm or service.

Customers in the telecom industry can choose from a variety of service providers and actively switch from one to the next. The telecommunications business has an annual churn rate of 15-25 percent in this highly competitive market.

Individualized customer retention is tough because most firms have a large number of customers and can't afford to devote much time to each of them. The costs would be too great, outweighing the additional revenue. However, if a corporation could forecast which customers are likely to leave ahead of time, it could focus customer retention efforts only on these "high risk" clients. The ultimate goal is to expand its coverage area and retrieve more customers loyalty. The core to succeed in this market lies in the customer itself.

Customer churn is a critical metric because it is much less expensive to retain existing customers than it is to acquire new customers.

To detect early signs of potential churn, one must first develop a holistic view of the customers and their interactions across numerous channels.As a result, by addressing churn, these businesses may not only preserve their market position, but also grow and thrive. More customers they have in their network, the lower the cost of initiation and the larger the profit. As a result, the company's key focus for success is reducing client attrition and implementing effective retention strategy.


# Objectives:
Finding the % of Churn Customers and customers that keep in with the active services.
Analysing the data in terms of various features responsible for customer Churn
Dataset:
Telco Customer Churn

The data set includes information about:
Customers who left within the last month – the column is called Churn
Services that each customer has signed up for – phone, multiple lines, internet, online security, online backup, device protection, tech support, and streaming TV and movies
Customer account information – how long they’ve been a customer, contract, payment method, paperless billing, monthly charges, and total charges
Demographic info about customers – gender, age range, and if they have partners and dependents
Implementation:
Libraries: Matplotlib, pandas, seaborn, and NumPy

# Few glimpses of EDA:
# DASHBOARDS (PowerBI):

<img width="878" height="496" alt="Image" src="https://github.com/user-attachments/assets/2825a0db-c63c-44db-94f8-99bfbe1d952c" />
<img width="871" height="498" alt="Image" src="https://github.com/user-attachments/assets/5c94839c-c379-46d5-920f-50c9967cd19e" />
<img width="914" height="497" alt="Image" src="https://github.com/user-attachments/assets/92c48526-2af5-4d47-8038-1d00109ec065" />
<img width="873" height="498" alt="Image" src="https://github.com/user-attachments/assets/5b319400-f867-4205-b5fd-333ef0c66fb1" />



# 1. Churn distribution (Python):
Churn distribution
<img width="271" height="285" alt="Image" src="https://github.com/user-attachments/assets/7a915688-139d-44d4-84ec-40e8a4b9e225" />

26.6 % of customers switched to another firm.

# 2. Churn distribution with respect to gender:
Churn distribution wrt Gender

<img width="990" height="554" alt="Image" src="https://github.com/user-attachments/assets/1f13a8b5-9c20-47e4-a466-af7182b33384" />
There is negligible difference in customer percentage/count who changed the service provider. Both genders behaved in similar fashion when it comes to migrating to another service provider/firm.`

# 3. Customer Contract distribution:
Customer contract distribution
<img width="485" height="408" alt="Image" src="https://github.com/user-attachments/assets/75c45c33-b4f8-4463-8953-31f7ab385323" />

About 75% of customer with Month-to-Month Contract opted to move out as compared to 13% of customrs with One Year Contract and 3% with Two Year Contract

# 4. Payment Methods:
Distribution of Payments methods Churn wrt payment methods
<img width="561" height="289" alt="Image" src="https://github.com/user-attachments/assets/51941369-1907-46fa-96e4-cf740315ae40" />

Major customers who moved out were having Electronic Check as Payment Method. Customers who opted for Credit-Card automatic transfer or Bank Automatic Transfer and Mailed Check as Payment Method were less likely to move out.

# 5. Internet services:
Several customers choose the Fiber optic service and it's also evident that the customers who use Fiber optic have high churn rate, this might suggest a dissatisfaction with this type of internet service. Customers having DSL service are majority in number and have less churn rate compared to Fibre optic service.
<img width="919" height="225" alt="Image" src="https://github.com/user-attachments/assets/ebe15f1e-d503-4ef8-b11c-44d759be8523" />

Churn distribution w.r.t Internet services and Gender

# 6. Dependent distribution:
Customers without dependents are more likely to churn.

Churn distribution w.r.t dependents

# 7. Online Security:
As shown in following graph, most customers churn due to lack of online security
<img width="406" height="321" alt="Image" src="https://github.com/user-attachments/assets/f83f0dde-48a1-4dca-be3f-477be72aa6b7" />
Churn distribution w.r.t online security

# 8. Senior Citizen:
Most of the senior citizens churn; the number of senior citizens are very less in over all customer base.
<img width="341" height="322" alt="Image" src="https://github.com/user-attachments/assets/16595d00-9db2-4645-855a-aeaf5fa51973" />
Churn distribution w.r.t Senior Citizen

# 9. Paperless Booking:
Customers with Paperless Booking are most likely to churn.
<img width="363" height="323" alt="Image" src="https://github.com/user-attachments/assets/7a63230c-404f-456c-b73c-749cc93b48b9" />

Churn distribution w.r.t mode of booking

#  10. Tech support:
As shown in following chart, customers with no TechSupport are most likely to migrate to another service provider.
<img width="405" height="322" alt="Image" src="https://github.com/user-attachments/assets/59461543-ce32-497e-a784-7f13f2f6bdfe" />
Churn distribution w.r.t Tech support

# 11. Distribution w.r.t Monthly and Total Charges :
Monthly Charges Total Charges
<img width="470" height="323" alt="Image" src="https://github.com/user-attachments/assets/a5911231-4b9f-4fc1-a227-3e67be499774" />
<img width="468" height="323" alt="Image" src="https://github.com/user-attachments/assets/8387301c-e450-4ccb-8271-5673f774d94e" />

Customers with higher Monthly Charges are also more likely to churn.
New customers are more likely to churn.

# Correlation Analysis 
<img width="999" height="462" alt="Image" src="https://github.com/user-attachments/assets/0a2e35cc-a851-4acd-8433-c40da68f6409" />

<img width="987" height="454" alt="Image" src="https://github.com/user-attachments/assets/b82f7bec-ebf6-43c9-93a2-23a1a2ab17c0" />

# Important Features Contribution Towards Churn 
<img width="920" height="493" alt="Image" src="https://github.com/user-attachments/assets/67284b2f-70d6-489e-940c-6569e90fbf8c" />
