def test(dic_list):
    list_set = list()
    for i in range(len(dic_list)):
        list_set.append(i)
        print(dic_list[i])
    return list_set

rank_exponent = [0.13594827958556543, 0.13311353532199863, 0.13001447702381036, 0.1265882289933885, 0.12274504404571733, 0.11834985137235296, 0.11318417620972909, 0.1068557672358068, 0.09853254835558745, 0.08577756547395923]
rank_sum = [0.18181818181818182, 0.16363636363636364, 0.14545454545454545, 0.12727272727272726, 0.10909090909090909, 0.09090909090909091, 0.07272727272727272, 0.05454545454545454, 0.03636363636363636, 0.01818181818181818]
balance_beam = [0.2507836990595611,0.18808777429467083,0.12539184952978055,0.10971786833855798,0.09404388714733541,0.06269592476489028,0.050156739811912224,0.04702194357366771,0.04075235109717868,0.03134796238244514]
priority = ["transfer", "bikeroad", "rest", "bikerental", "height", "forest", "store", "lunch", "pollution", "toilet"]
weight_name = ["rank_exponent", "rank_sum", "balance_beam"]

weight_dic = {}
weight_list = []
dic_list = []

weight_list.append(rank_exponent)
weight_list.append(rank_sum)
weight_list.append(balance_beam)
list_result = [[0]for rows in range(3)]

for i in range(len(weight_list)):
    for j in range(len(weight_list[i])):
        weight_dic[str(priority[j])] = round(weight_list[i][j], 2)
    dic_list.append(weight_dic)

list_result[0][0] = 1
print(len(dic_list))