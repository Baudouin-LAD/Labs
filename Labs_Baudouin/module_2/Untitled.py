#Education Sector encoded
data["education_sector"] = data["education_sector"].replace('e.g.,','e.g.', regex=True)
sector = (','.join(data["education_sector"]))
sector_list = list(set(sector.split(",")))
sector_list = list(map(str.strip, sector_list))
sector_list
     
istype = lambda i,j: 1 if str(i) in str(j) else 0
def New_column(i):
    data[str(i)]= data["education_sector"].apply(lambda x: istype(str(i),x))
    return
for i in sector_list:
    New_column(i)
    
    
#key_traits encoded
pd.get_dummies(data, prefix=['trait'])