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
        body: BlocBuilder<ItemInfoCubit,ItemInfoState>(builder: (context,itemInfoState){
          var widgetList = itemInfoState.widgetList;
          if(widgetList.isEmpty) {
            return const Center(child: Text('Press + button for add dynamic TextFormField'),);
          }
          else {
            // return ReorderableListView.builder(itemBuilder: (context,index){
            //   return Table(key: Key('$index'),
            //     children: [
            //       const TableRow(children: [
            //         TableCell(child: Text('Id',style: TextStyle(fontSize: 20),)),
            //         // TableCell(child: Text('Qty',style: TextStyle(fontSize: 20),)),
            //         // TableCell(child: Text('Price',style: TextStyle(fontSize: 20),)),
            //         // TableCell(child: Text('Disc',style: TextStyle(fontSize: 20),)),
            //         // TableCell(child: Text('Action',style: TextStyle(fontSize: 20),)),
            //
            //       ]),
            //       TableRow(children: [
            //         TableCell(child: widgetList[index]),
            //       ])
            //     ],
            //   );
            //   // return Container(key: Key('$index'),child: widgetList[index],);
            //
            // }, itemCount: widgetList.length, onReorder: (oldIndex,newIndex){
            //   if (oldIndex < newIndex) {
            //     newIndex -= 1;
            //   }
            //   final item = widgetList.removeAt(oldIndex);
            //   widgetList.insert(newIndex, item);
            //   context.read<ItemInfoCubit>().itemInfoStateUpdate(widgetList: widgetList, itemData: itemInfoState.itemInfo);
            // });

            return Padding(padding: const EdgeInsets.all(20),
              child: SizedBox(
                child: Table(border: TableBorder.all(color: Colors.black,width: 2),
                  children:  [
                  TableRow(
                    children: [
                      getHeader(),
                    ]
                  ),
                  TableRow(
                    children: [
                      ReorderableListView.builder(
                        itemBuilder: (context,index){
                        return Container(key: Key('$index'),child: Column(
                          children: [
                            widgetList[index],
                            const Divider(color: Colors.black,height: 2,),
                          ],
                        ),);
                      }, itemCount: widgetList.length, onReorder: (oldIndex,newIndex){
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final item = widgetList.removeAt(oldIndex);
                          widgetList.insert(newIndex, item);
                          context.read<ItemInfoCubit>().itemInfoStateUpdate(widgetList: widgetList, itemData: itemInfoState.itemInfo);
                      },shrinkWrap: true,),
                    ]
                  ),

                ],),
              ),
            );
          }
        },),
      // body: context.watch<ItemInfoCubit>().state.widgetList.isEmpty ? const Center(child: Text('Text'),) : getData(widgetList: context.watch<ItemInfoCubit>().state.widgetList),
    );
  }

IntrinsicHeight getHeader() {
    return IntrinsicHeight(
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: const [

        Expanded(flex: 4,
            child: Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 20),child: Text('Item Details',style: TextStyle(fontSize: 15),),),)),
        VerticalDivider(color: Colors.black,width: 2,),
        Expanded(flex: 1,
            child: Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 20),child: Text('Qty',style: TextStyle(fontSize: 15),),),)),
        VerticalDivider(color: Colors.black,width: 2,),
        Expanded(flex: 2,
            child: Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 20),child: Text('Price',style: TextStyle(fontSize: 15),),),)),
        VerticalDivider(color: Colors.black,width: 2,),
        Expanded(flex: 1,
            child: Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 20),child: Text('Disc(%)',style: TextStyle(fontSize: 15),),),)),
        VerticalDivider(color: Colors.black,width: 2,),
        Expanded(flex: 1,
            child: Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 20),child: Text('Tax Rate',style: TextStyle(fontSize: 15),),),)),
        VerticalDivider(color: Colors.black,width: 2,),
        Expanded(flex: 2,
            child: Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 20),child: Text('Amount',style: TextStyle(fontSize: 15),),),)),
        VerticalDivider(color: Colors.black,width: 2,),
        Expanded(flex: 1,
            child: Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 20),child: Text('Action',style: TextStyle(fontSize: 15),),),)),


        //
        // SizedBox(width: MediaQuery.of(context).size.width*.2,child: const Center(child: Padding(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        //   child: Text('Item Details',style: TextStyle(fontSize: 15),),
        // ),)),
        // const VerticalDivider(color: Colors.black,width: 2,),
        //  SizedBox(width: MediaQuery.of(context).size.width*.1,child: const Center(child: Padding(
        //    padding: EdgeInsets.symmetric(vertical: 20),
        //    child: Text('Qty',style: TextStyle(fontSize: 15),),
        //  ),)),
        // const VerticalDivider(color: Colors.black,width: 2,),
        // SizedBox(width: MediaQuery.of(context).size.width*.1,child: const Center(child: Padding(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        //   child: Text('Price',style: TextStyle(fontSize: 15),),
        // ),)),
        // const VerticalDivider(color: Colors.black,width: 2,),
        // SizedBox(width: MediaQuery.of(context).size.width*.1,child: const Center(child: Padding(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        //   child: Text('Disc(%)',style: TextStyle(fontSize: 15),),
        // ),)),
        // const VerticalDivider(color: Colors.black,width: 2,),
        // SizedBox(width: MediaQuery.of(context).size.width*.1,child: const Center(child: Padding(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        //   child: Text('Tax Rate',style: TextStyle(fontSize: 15),),
        // ),)),
        // const VerticalDivider(color: Colors.black,width: 2,),
        // SizedBox(width: MediaQuery.of(context).size.width*.1,child: const Center(child: Padding(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        //   child: Text('Amount',style: TextStyle(fontSize: 15),),
        // ),)),
        // const VerticalDivider(color: Colors.black,width: 2,),
        // SizedBox(width: MediaQuery.of(context).size.width*.1,child: const Center(child: Padding(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        //   child: Text('Action',style: TextStyle(fontSize: 15),),
        // ),)),
      ],
      ),
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


class MultiItemFormWidget extends StatefulWidget {
  const MultiItemFormWidget({Key? key}) : super(key: key);

  @override
  State<MultiItemFormWidget> createState() => _MultiItemFormWidgetState();
}

class _MultiItemFormWidgetState extends State<MultiItemFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamics Items'),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        var itemDataCubit = context.read<ItemDataCubit>();
        var mapValues = itemDataCubit.state.itemInfo;
        var keysData = mapValues.keys;
        var lastValueOfKey = keysData.isEmpty ? -1 : keysData.last;
        var lastValueOfKeyUpdate = lastValueOfKey +1 ;
        mapValues[lastValueOfKeyUpdate] = {'Qty_$lastValueOfKeyUpdate' : '0','Price_$lastValueOfKeyUpdate' : '0',
          'Disc_$lastValueOfKeyUpdate' : '0','Amount_$lastValueOfKeyUpdate' : '0',};
        // itemInfoCubit.itemInfoStateUpdate(itemData: mapValues);
        var widgetList = itemDataCubit.state.widgetList;
        widgetList[lastValueOfKeyUpdate] = ContactFormItemWidget(widgetId: lastValueOfKeyUpdate, onRemove: () =>onRemove(indexValue: lastValueOfKeyUpdate));
        // widgetList.putIfAbsent(lastValueOfKeyUpdate, () => ContactFormItemWidget(widgetId: lastValueOfKeyUpdate, onRemove: () =>onRemove(indexValue: lastValueOfKeyUpdate)));
        itemDataCubit.itemDataStateUpdate(mapValues: mapValues, mapWidgets: widgetList);
        // widgetList.add(ContactFormItemWidget(widgetId: lastValueOfKeyUpdate, onRemove: () => onRemove(indexValue: lastValueOfKeyUpdate)));
        // itemInfoCubit.itemInfoStateUpdate(widgetList: widgetList,itemData: mapValues);
      },child: const Icon(Icons.add),),
      // body: context.watch<ItemDataCubit>().state.widgetList.isEmpty ? const Center(child: Text('Text'),) : getData(widgetList: context.watch<ItemDataCubit>().state.widgetList),
      body: BlocBuilder<ItemDataCubit,ItemDataState>(builder: (context,state){
        if(state.widgetList.isEmpty) {
          return const Center(child: Text('Press + buttton for add dynamic TextFormfield'),);
        }
        return getData(context: context,widgetList: state.widgetList);
      },),
      // body: BlocBuilder<ItemDataCubit,ItemDataState>(builder: (context,newState){
      //   if(newState.widgetList.isEmpty || newState.itemInfo.isEmpty) {
      //     return const Center(child: Text('Press + button for add dynamic textFormField'),);
      //   }
      //   else {
      //     return getData(widgetList: newState.widgetList);
      //     // return ListView.builder(itemBuilder: (context,indexValue){
      //     //   return newState.widgetList['$indexValue'] ?? Container();
      //     // },itemCount: newState.widgetList.length,);
      //
      //   }
      // },),
    );
  }

  ReorderableListView getData({required BuildContext context,required Map<int,ContactFormItemWidget> widgetList}){
    // var getAllKeys = widgetList.keys.toList();
    // var getAllValuesNew = widgetList.values.toList();
    var getAllValues = widgetList;
    return ReorderableListView(scrollController: ScrollController(), onReorder: (oldIndex,newIndex){
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      var oldIndexData =  getAllValues.remove(getAllValues[oldIndex]);
      // var newIndexData = getAllValues[newIndex];
      // // var item = getAllValues.remove(oldIndex);
      getAllValues[newIndex] = oldIndexData!;
      // getAllValues[oldIndex] = newIndexData!;

/*
      var item = getAllKeys.removeAt(oldIndex);
      getAllKeys.insert(newIndex, item);
      var itemNew = getAllValuesNew.removeAt(oldIndex);
      getAllValuesNew.insert(newIndex,itemNew);

      Map<int,ContactFormItemWidget> mapData= {};

      for(int i=0; i<getAllKeys.length; i++) {
        mapData[getAllKeys[i]] = getAllValuesNew[i];
      }
*/

      context.read<ItemDataCubit>().itemDataStateUpdate(mapValues: context.read<ItemDataCubit>().state.itemInfo, mapWidgets: getAllValues);

    },children: <Widget>[
      for (int index = 0; index < widgetList.length; index += 1)
        Container(
          key: Key('$index'),
         child: widgetList[index],
        ),
    ],);
    // return ListView(children: data,);
  }

  onRemove({required int indexValue}){
    var itemDataCubit = context.read<ItemDataCubit>();
    var widgetList = itemDataCubit.state.widgetList;
    var mapValues = itemDataCubit.state.itemInfo;

    widgetList.remove(indexValue);
    mapValues.remove(indexValue);
    // int index = widgetList.indexWhere((element) => element.widgetId == indexValue);
    // widgetList.removeAt(index);
    // mapValues.remove(indexValue);
    // itemInfoCubit.itemInfoStateUpdate(widgetList: widgetList, itemData: mapValues);
    // itemInfoCubit.itemInfoUpdate(itemData: mapValues);
    // itemInfoCubit.updateWidgetList(widgetList: widgetList);
    debugPrint('\\nThe widgetList is : $widgetList \n\nand the mapValues is : $mapValues\n\n');

    itemDataCubit.itemDataStateUpdate(mapValues: mapValues, mapWidgets: widgetList);


    // debugPrint('\n\nThe index is : $index\n\n');
  }
}

