USE MLS_Db_Cop4710;

SELECT Listings.address
FROM Listings, House
WHERE Listings.address = House.address;

Select Listings.address, Listings.mlsNumber
From Listings, House
Where Listings.address = House.address;

SELECT Listings.address
FROM Listings, House
WHERE Listings.address = House.address AND House.bedrooms = 3 AND House.bathrooms = 2;

SELECT address, price 
FROM House
WHERE bedrooms = 3 AND bathrooms = 2 AND price >= 100000 AND price <= 250000
ORDER BY price DESC;

SELECT address, price
FROM businessproperty
WHERE type ='office'
ORDER BY price DESC;

SELECT agentId, Agent.name, phone, Firm.name, dateStarted
FROM Agent, Firm
WHERE Agent.firmId = Firm.id;

SELECT property.*
FROM property, listings
WHERE property.address = Listings.address AND listings.agentId = 147; 

SELECT Agent.name AS Agent_Name, Buyer.name AS Buyer_Name
FROM agent, buyer, works_with
WHERE agent.agentId = works_with.agentID AND buyer.id = works_with.buyerId
ORDER BY Agent_Name;

SELECT DISTINCT agent.agentId, (SELECT COUNT(works_with.buyerId) FROM works_with WHERE agent.agentID = works_with.agentID) AS "Agent.id-count pairs"
FROM agent, buyer, works_with
WHERE works_with.agentID = agent.agentId AND works_with.buyerId = buyer.id;

SELECT house.*
FROM house, buyer
WHERE buyer.id = 9574 AND
	buyer.bedrooms = house.bedrooms AND
    buyer.bathrooms = house.bathrooms AND 
    buyer.minimumPreferredPrice <= house.price AND
    buyer.maximumPreferredPrice >= house.price
ORDER BY house.price DESC;