import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:cp_driver_app/entity/page_entity.dart';
import 'package:cp_driver_app/enum/tag_type.dart';
import 'package:cp_driver_app/http_util/request.dart' as http;
import 'package:cp_driver_app/http_util/api.dart';

class TabListRepository extends IRepository {
  Future<BaseEntity<PageEntity<List<ArticleInfoDatas>>>> getList(
      {required int page, required String id, required TagType tagType}) async {
    switch (tagType) {
      case TagType.project:
        final params = <String, String>{};
        params["cid"] = id.toString();
        final api = "${Api.getProjectClassifyList}${page.toString()}/json";
        return await http.Request.get(api: api, params: params);
      case TagType.publicNumber:
        final api =
            "${Api.getPublicNumberList}${id.toString()}/${page.toString()}/json";
        return await http.Request.get(api: api);
      case TagType.tree:
        return BaseEntity<PageEntity<List<ArticleInfoDatas>>>(null, null, null);
    }
  }
}
