grid = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\grid_4326(59x54).shp", "grid_4326(59x54)", "ogr")
industry = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\industry_4326.shp", "industry_4326", "ogr")
height = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\height_4326.shp", "height_4326", "ogr")
join_ind = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\Join_ind_4326.shp", "join_ind_4326", "ogr")
lunch = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\lunch_5174.shp", "lunch_5174", "ogr")
rest = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\Rest_5174.shp", "rest_5174", "ogr")
forest = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\Forest_4326.shp", "forest_4326", "ogr")
transfer = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\Transfer_4326.shp", "transfer_4326", "ogr")
whos = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\whos_4326.shp", "whos_4326", "ogr")
store = iface.addVectorLayer("C:\Users\user\Downloads\project_thanos\collect\store_4326.shp", "store_4326", "ogr")

class Map:
    def __init__(self):
        self.xmin = 0
        self.ind = 0
        self.forest = 0
        self.height = 0
        self.lunch = 0
        self.rest = 0
        self.whos = ""
        self.bus = 0
        self.pollution = 0
        self.result = 0

    def setResult(self):
        self.result = 1 * self.xmin + 2 * self.rest

maps = [[Map() for cols in range(54)]for rows in range(59)]

for f in grid.getFeatures():
     for i in range(54):
         for j in range(59):
             maps[j][i].xmin = f["xmin"]
