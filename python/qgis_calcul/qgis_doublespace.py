import csv

grid = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\grid_4326(55x51).shp", "grid_4326(55x51)", "ogr")
grid2 = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\grid_5179.shp", "grid_5179", "ogr")
industry = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\industry_4326.shp", "industry_4326", "ogr")
height = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\height_point_4326.shp", "height_4326", "ogr")
join_ind = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\Join_ind_4326.shp", "join_ind_4326", "ogr")
lunch = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\lunch_5174.shp", "lunch_5174", "ogr")
rest = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\Rest_5174.shp", "rest_5174", "ogr")
forest = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\Forest_4326.shp", "forest_4326", "ogr")
transfer = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\Transfer_4326.shp", "transfer_4326", "ogr")
store = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\store_4326.shp", "store_4326", "ogr")
pollution = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\pollution_4326.shp", "pollution_4326", "ogr")
toilet = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect/toilet_4326.shp", "toilet_4326", "ogr")
bikeroad = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect/bikeroad_4326.shp", "bikeroad_4326", "ogr")
bikerental = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect/bikerental_4326.shp", "bikerental_4326", "ogr")

class Map:
  def __init__(self):
    self.xmin = 0.0
    self.ymin = 0.0
    self.ind = 0.0
    self.forest = 0.0
    self.height = 0.0
    self.lunch = 0.0
    self.rest = 0.0
    self.pollution = 0.0
    self.result = [[0]for rows in range(3)]
    self.transfer = 0.0
    self.toilet = 0.0
    self.bikerental = 0.0
    self.bikeroad = 0.0
  def set_result(self, dic_list):
    for i in range(len(dic_list)):
      self.result[i] = (dic_list[i]["transfer"] * self.transfer) - (dic_list[i]["forest"] * self.forest) + (dic_list[i]["height"] * self.height / 5) + (dic_list[i]["lunch"] * self.lunch)/471 + (dic_list[i]["rest"] * self.rest)/374.94 - (dic_list[i]["pollution"] * self.pollution) + (dic_list[i]["bikeroad"] * self.bikeroad) + (dic_list[i]["bikerental"] * self.bikerental) + ((dic_list[i]["store"] * self.store)/3.8 + (dic_list[i]["toilet"] * self.toilet))

def set_ind(maps):
  for i in range(55):
    for j in range(51):
      if maps[i][j].ind != 0:
        maps[i][j].result = 0

rank_exponent = [0.13594827958556543, 0.13311353532199863, 0.13001447702381036, 0.1265882289933885, 0.12274504404571733, 0.11834985137235296, 0.11318417620972909, 0.1068557672358068, 0.09853254835558745, 0.08577756547395923]
rank_sum = [0.18181818181818182, 0.16363636363636364, 0.14545454545454545, 0.12727272727272726, 0.10909090909090909, 0.09090909090909091, 0.07272727272727272, 0.05454545454545454, 0.03636363636363636, 0.01818181818181818]
balance_beam = [0.2507836990595611,0.18808777429467083,0.12539184952978055,0.10971786833855798,0.09404388714733541,0.06269592476489028,0.050156739811912224,0.04702194357366771,0.04075235109717868,0.03134796238244514]
priority = ["transfer", "bikeroad", "rest", "bikerental", "height", "forest", "store", "lunch", "pollution", "toilet"]
weight_name = ["rank_exponent", "rank_sum", "balance_beam"]


weight_list = []
dic_list = []

weight_list.append(rank_exponent)
weight_list.append(rank_sum)
weight_list.append(balance_beam)

for i in range(len(weight_list)):
  weight_dic = {}
  for j in range(len(weight_list[i])):
    weight_dic[str(priority[j])] = round(weight_list[i][j]*100, 2)
  dic_list.append(weight_dic)

maps = [[Map() for cols in range(51)]for rows in range(55)]

xmin_list = []
ymin_list = []
xmax_list = []
ymax_list = []

for f in grid.getFeatures():
  xmin_list.append(f["xmin"])
  ymin_list.append(f["ymin"])
  xmax_list.append(f["xmax"])
  ymax_list.append(f["ymax"])

count = 0
for i in range(55):
  for j in range(51):
    maps[i][j].xmin = xmin_list[count]
    maps[i][j].ymin = ymin_list[count]
    count += 1

join_ind_list = []
for f in join_ind.getFeatures():
  for i in range(55):
      for j in range(51):
          if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin:
              maps[i][j].ind = 1.0


for f in lunch.getFeatures():
  for i in range(55):
    for j in range(51):
      if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin:
        maps[i][j].lunch = f["population"]


for f in rest.getFeatures():
  for i in range(55):
    for j in range(51):
      if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin:
        maps[i][j].rest = f["population"]


for f in height.getFeatures():
  for i in range(55):
    for j in range(51):
      if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin:
        maps[i][j].height = f["A27"]

for f in forest.getFeatures():
  for i in range(55):
    for j in range(51):
      if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin:
        maps[i][j].forest = f["NUMPOINTS"]

for f in transfer.getFeatures():
  for i in range(55):
    for j in range(51):
      if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin:
        maps[i][j].transfer = f["NUMPOINTS"]

for f in store.getFeatures():
  for i in range(55):
    for j in range(51):
      if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin:
        maps[i][j].store = f["NUMPOINTS"]

for f in pollution.getFeatures():
  for i in range(55):
    for j in range(51):
      if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin:
        maps[i][j].pollution = f["NUMPOINTS"]

for f in toilet.getFeatures():
  for i in range(55):
    for j in range(51):
      if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin and f["NUMPOINTS"] != 0:
        maps[i][j].toilet = 1.0

for f in bikeroad.getFeatures():
  for i in range(55):
    for j in range(51):
      if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin and f["NUMPOINTS"] != 0:
        maps[i][j].bikeroad = 1.0

for f in bikerental.getFeatures():
  for i in range(55):
    for j in range(51):
      if f["xmin"] == maps[i][j].xmin and f["ymin"] == maps[i][j].ymin and f["NUMPOINTS"] != 0:
        maps[i][j].bikerental = 1.0

list_result = []
for i in range(55):
  for j in range(51):
    Map.set_result(maps[i][j], dic_list)
    if maps[i][j].ind == 0:
      for x in range(3):
        maps[i][j].result[x] = 0
    list_result.append(maps[i][j].result)


point_csv = open('C:/Users/user/Downloads/project_thanos/collect/result_5197.csv', 'w')
csv_writer = csv.writer(point_csv, delimiter=',', quoting=csv.QUOTE_MINIMAL)
headers = ['lat', 'lng', 'point_rankexponent', 'point_ranksum', 'point_balancebeam']
csv_writer.writerow(headers)

for i in range(2805):
  list_csv = []
  x_mean = (xmax_list[i] + xmin_list[i]) / 2
  y_mean = (ymax_list[i] + ymin_list[i]) / 2
  list_csv.append(x_mean)
  list_csv.append(y_mean)
  for j in range(len(list_result[i])):
    list_csv.append(list_result[i][j])
  csv_writer.writerow(list_csv)

point_csv.close()
