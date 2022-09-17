
import 'package:dynamic_list/contact_form_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemInfoState {
  Map<int,Map<String,dynamic>> itemInfo;
  List<ContactFormItemWidget> widgetList;
  ItemInfoState({required this.itemInfo,required this.widgetList});
}


class ItemInfoCubit extends Cubit<ItemInfoState> {
  ItemInfoCubit() : super(ItemInfoState(itemInfo: {}, widgetList: []));
  itemInfoStateUpdate({required List<ContactFormItemWidget> widgetList,required Map<int,Map<String,dynamic>> itemData}) {
    emit(ItemInfoState(itemInfo: itemData, widgetList: widgetList));
  }

 /* itemInfoUpdate({required Map<int,Map<String,dynamic>> itemData}){
      emit(ItemInfoState(itemInfo: itemData, widgetList: state.widgetList));
  }*/

}