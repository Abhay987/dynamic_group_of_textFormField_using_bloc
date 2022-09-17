import 'package:dynamic_list/bloc.dart';
import 'package:dynamic_list/contact_form_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MultiContactFormWidget extends StatefulWidget {
  const MultiContactFormWidget({Key? key}) : super(key: key);

  @override
  State<MultiContactFormWidget> createState() => _MultiContactFormWidgetState();
}

class _MultiContactFormWidgetState extends State<MultiContactFormWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Dynamic TextFormField'),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        var itemInfoCubit = context.read<ItemInfoCubit>();
        var mapValues = itemInfoCubit.state.itemInfo;
        var keysData = mapValues.keys;
        var lastValueOfKey = keysData.isEmpty ? -1 : keysData.last;
        var lastValueOfKeyUpdate = lastValueOfKey +1 ;
        mapValues[lastValueOfKeyUpdate] = {'Qty_$lastValueOfKeyUpdate' : '0','Price_$lastValueOfKeyUpdate' : '0',
          'Disc_$lastValueOfKeyUpdate' : '0','Amount_$lastValueOfKeyUpdate' : '0',};
        // itemInfoCubit.itemInfoStateUpdate(itemData: mapValues);
        var widgetList = itemInfoCubit.state.widgetList;
        widgetList.add(ContactFormItemWidget(widgetId: lastValueOfKeyUpdate, onRemove: () => onRemove(indexValue: lastValueOfKeyUpdate)));
        itemInfoCubit.itemInfoStateUpdate(widgetList: widgetList,itemData: mapValues);
      },child: const Icon(Icons.add),),

      // body: BlocBuilder<ItemInfoCubit,ItemInfoState>(builder: (context,state){
      //   if(state.widgetList.isEmpty) {
      //     return const Center(child: Text('Press + button for add dynamic TextFormField'),);
      //   }
      //   else {
      //     return Column(
      //       children: [
      //         Expanded(flex: 8,
      //           child: ListView.builder(itemBuilder: (context,index){
      //             return state.widgetList[index];
      //           },itemCount: state.widgetList.length,controller: ScrollController(),),
      //         ),
      //         Expanded(flex:2,child: Text('${state.itemInfo}')),
      //       ],
      //     );
      //   }
      // },),

      body: context.watch<ItemInfoCubit>().state.widgetList.isEmpty ? const Center(child: Text('Text'),) : getData(widgetList: context.watch<ItemInfoCubit>().state.widgetList),
    );
  }


 ListView getData({required List<ContactFormItemWidget> widgetList}){
    List<Widget> data = [];
    for(var mapValues in widgetList) {
      data.add(mapValues);
    }
    return ListView(children: data,);
  }

  onRemove({required int indexValue}){
    var itemInfoCubit = context.read<ItemInfoCubit>();
    var widgetList = itemInfoCubit.state.widgetList;
    var mapValues = itemInfoCubit.state.itemInfo;
      int index = widgetList.indexWhere((element) => element.widgetId == indexValue);
      widgetList.removeAt(index);
      mapValues.remove(indexValue);
      itemInfoCubit.itemInfoStateUpdate(widgetList: widgetList, itemData: mapValues);
      setState(() {

      });
      // itemInfoCubit.itemInfoUpdate(itemData: mapValues);
      // itemInfoCubit.updateWidgetList(widgetList: widgetList);


    debugPrint('\n\nThe index is : $index\n\n');
  }
}
