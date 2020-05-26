/*
 * @Author: daiGuilin
 * @Date: 2020-05-25 16:08:03
 * @LastEditTime: 2020-05-26 10:21:20
 * @LastEditors: daiGuilin
 */
class CategoryBigModel {
  String mallCategoryId; //类别编号
  String mallCategoryName; //类别名称
  List<dynamic> bxMallSubDto; //小类列表
  String image; //类别图片
  Null comments; //列表描述
  //构造函数
  CategoryBigModel(
      {this.mallCategoryId,
      this.mallCategoryName,
      this.comments,
      this.image,
      this.bxMallSubDto});

  factory CategoryBigModel.formJson(dynamic json) {
    return CategoryBigModel(
        mallCategoryId: json['mallCategoryId'],
        mallCategoryName: json['mallCategoryName'],
        comments: json['comments'],
        image: json['image'],
        bxMallSubDto: json['bxMallSubDto']);
  }
}

class CategoryBigListModel {
  List<CategoryBigModel> data;
  CategoryBigListModel(this.data);
  factory CategoryBigListModel.formJson(List json) {
    return CategoryBigListModel(
        json.map((i) => CategoryBigModel.formJson(i)).toList());
  }
}
