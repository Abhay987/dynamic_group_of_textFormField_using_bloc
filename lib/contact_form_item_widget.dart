import 'package:flutter/material.dart';

class ContactFormItemWidget extends StatefulWidget {
   final int widgetId;
   final Function onRemove;
  const ContactFormItemWidget({Key? key,required this.widgetId,required this.onRemove}) : super(key: key);

  @override
  State<ContactFormItemWidget> createState() => _ContactFormItemWidgetState();
}

class _ContactFormItemWidgetState extends State<ContactFormItemWidget> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [

          Expanded(flex: 4,
              child: Center(child: Text('Id : ${widget.widgetId}'))),
          const VerticalDivider(color: Colors.black,width: 2,),
          Expanded(flex: 1,
              child: TextFormField(
                textAlign: TextAlign.center,
                // // initialValue: '${context.read<ItemInfoCubit>().state.itemInfo[widget.widgetId]!['Qty_${widget.widgetId}']}',
                // controller: TextEditingController()..text = '${context.read<ItemInfoCubit>().state.itemInfo[widget.widgetId]!['Qty_${widget.widgetId}']}',
                // onChanged: (value){
                //   num qtyValue = num.tryParse(value) ?? 0;
                //   var itemInfoCubit = context.read<ItemInfoCubit>();
                //   var mapValue = itemInfoCubit.state.itemInfo;
                //   mapValue[widget.widgetId]!['Qty_${widget.widgetId}'] = qtyValue;
                //   mapValue[widget.widgetId]!['Amount_${widget.widgetId}'] = qtyValue * mapValue[widget.widgetId]!['Price_${widget.widgetId}'];
                //   itemInfoCubit.itemInfoStateUpdate(widgetList: itemInfoCubit.state.widgetList, itemData: mapValue);
                // },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  // border: OutlineInputBorder(),
                  // hintText: "Enter no of Qty",
                  // labelText: "Qty",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              )),
          const VerticalDivider(color: Colors.black,width: 2,),
          Expanded(flex: 2,
              child: TextFormField(
                textAlign: TextAlign.center,
                // // initialValue: '${context.read<ItemInfoCubit>().state.itemInfo[widget.widgetId]!['Price_${widget.widgetId}']}',
                // controller: TextEditingController()..text = '${context.read<ItemInfoCubit>().state.itemInfo[widget.widgetId]!['Price_${widget.widgetId}']}',
                // onChanged: (value){
                //   num qtyValue = num.tryParse(value) ?? 0;
                //   var itemInfoCubit = context.read<ItemInfoCubit>();
                //   var mapValue = itemInfoCubit.state.itemInfo;
                //   mapValue[widget.widgetId]!['Price_${widget.widgetId}'] = qtyValue;
                //   mapValue[widget.widgetId]!['Amount_${widget.widgetId}'] = qtyValue * mapValue[widget.widgetId]!['Qty_${widget.widgetId}'];
                //   itemInfoCubit.itemInfoStateUpdate(widgetList: itemInfoCubit.state.widgetList, itemData: mapValue);
                // },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  // border: OutlineInputBorder(),
                  // hintText: "Enter Price Of Qty",
                  // labelText: "Price",
                ),
              )),
          const VerticalDivider(color: Colors.black,width: 2,),
          const Expanded(flex: 1,
              child: Center(child: Text('0'))),
          const VerticalDivider(color: Colors.black,width: 2,),
          const Expanded(flex: 1,
              child: Center(child: Text('0'))),
          const VerticalDivider(color: Colors.black,width: 2,),
          const Expanded(flex: 2,
              child: Center(child: Text('0'))),
          const VerticalDivider(color: Colors.black,width: 2,),
          Expanded(flex: 1,
              child: Center(
                child: IconButton(onPressed: (){
                  widget.onRemove();
                }, icon: const Icon(Icons.minimize)),
              )),


        //   SizedBox(width: MediaQuery.of(context).size.width*.2,child: Center(child: Text('Id : ${widget.widgetId}'))),
        //   const VerticalDivider(color: Colors.black,width: 2,),
        // SizedBox(width: MediaQuery.of(context).size.width*.1,child: Center(
        //   child: TextFormField(
        //     textAlign: TextAlign.center,
        //     // // initialValue: '${context.read<ItemInfoCubit>().state.itemInfo[widget.widgetId]!['Qty_${widget.widgetId}']}',
        //     // controller: TextEditingController()..text = '${context.read<ItemInfoCubit>().state.itemInfo[widget.widgetId]!['Qty_${widget.widgetId}']}',
        //     // onChanged: (value){
        //     //   num qtyValue = num.tryParse(value) ?? 0;
        //     //   var itemInfoCubit = context.read<ItemInfoCubit>();
        //     //   var mapValue = itemInfoCubit.state.itemInfo;
        //     //   mapValue[widget.widgetId]!['Qty_${widget.widgetId}'] = qtyValue;
        //     //   mapValue[widget.widgetId]!['Amount_${widget.widgetId}'] = qtyValue * mapValue[widget.widgetId]!['Price_${widget.widgetId}'];
        //     //   itemInfoCubit.itemInfoStateUpdate(widgetList: itemInfoCubit.state.widgetList, itemData: mapValue);
        //     // },
        //     decoration: const InputDecoration(
        //       contentPadding: EdgeInsets.symmetric(horizontal: 12),
        //       // border: OutlineInputBorder(),
        //       // hintText: "Enter no of Qty",
        //       // labelText: "Qty",
        //       border: InputBorder.none,
        //       focusedBorder: InputBorder.none,
        //       enabledBorder: InputBorder.none,
        //       errorBorder: InputBorder.none,
        //       disabledBorder: InputBorder.none,
        //     ),
        //   ),
        // ),),
        //   const VerticalDivider(color: Colors.black,width: 2,),
        // SizedBox(width: MediaQuery.of(context).size.width*.1,child: Center(
        //   child: TextFormField(
        //     textAlign: TextAlign.center,
        //     // // initialValue: '${context.read<ItemInfoCubit>().state.itemInfo[widget.widgetId]!['Price_${widget.widgetId}']}',
        //     // controller: TextEditingController()..text = '${context.read<ItemInfoCubit>().state.itemInfo[widget.widgetId]!['Price_${widget.widgetId}']}',
        //     // onChanged: (value){
        //     //   num qtyValue = num.tryParse(value) ?? 0;
        //     //   var itemInfoCubit = context.read<ItemInfoCubit>();
        //     //   var mapValue = itemInfoCubit.state.itemInfo;
        //     //   mapValue[widget.widgetId]!['Price_${widget.widgetId}'] = qtyValue;
        //     //   mapValue[widget.widgetId]!['Amount_${widget.widgetId}'] = qtyValue * mapValue[widget.widgetId]!['Qty_${widget.widgetId}'];
        //     //   itemInfoCubit.itemInfoStateUpdate(widgetList: itemInfoCubit.state.widgetList, itemData: mapValue);
        //     // },
        //     decoration: const InputDecoration(
        //       border: InputBorder.none,
        //       focusedBorder: InputBorder.none,
        //       enabledBorder: InputBorder.none,
        //       errorBorder: InputBorder.none,
        //       disabledBorder: InputBorder.none,
        //       contentPadding: EdgeInsets.symmetric(horizontal: 12),
        //       // border: OutlineInputBorder(),
        //       // hintText: "Enter Price Of Qty",
        //       // labelText: "Price",
        //     ),
        //   ),
        // ),),
        //   const VerticalDivider(color: Colors.black,width: 2,),
        // SizedBox(width: MediaQuery.of(context).size.width*.1,child: Center(
        //   child: TextFormField(
        //     textAlign: TextAlign.center,
        //     // // initialValue: '${context.read<ItemInfoCubit>().state.itemInfo[widget.widgetId]!['Disc_${widget.widgetId}']}',
        //     // controller: TextEditingController()..text = '${context.read<ItemInfoCubit>().state.itemInfo[widget.widgetId]!['Disc_${widget.widgetId}']}',
        //     // onChanged: (value){
        //     //   num qtyValue = num.tryParse(value) ?? 0;
        //     //   var itemInfoCubit = context.read<ItemInfoCubit>();
        //     //   var mapValue = itemInfoCubit.state.itemInfo;
        //     //   mapValue[widget.widgetId]!['Disc_${widget.widgetId}'] = qtyValue;
        //     //   itemInfoCubit.itemInfoStateUpdate(widgetList: itemInfoCubit.state.widgetList, itemData: mapValue);
        //     // },
        //     decoration: const InputDecoration(
        //       contentPadding: EdgeInsets.symmetric(horizontal: 12),
        //       border: InputBorder.none,
        //       focusedBorder: InputBorder.none,
        //       enabledBorder: InputBorder.none,
        //       errorBorder: InputBorder.none,
        //       disabledBorder: InputBorder.none,
        //       // border: OutlineInputBorder(),
        //       // hintText: "Enter Disc (%) per item",
        //       // labelText: "Disc(%)",
        //     ),
        //   ),
        // ),),
        // // BlocBuilder<ItemInfoCubit,ItemInfoState>(builder: (context,state){
        // //   return Text('${state.itemInfo[widget.widgetId]!['Amount_${widget.widgetId}']}');
        // // }),
        //   const VerticalDivider(color: Colors.black,width: 2,),
        //   SizedBox(width: MediaQuery.of(context).size.width*.1,child: const Center(child: Text('0')),),
        //   const VerticalDivider(color: Colors.black,width: 2,),
        //   SizedBox(width: MediaQuery.of(context).size.width*.1,child: const Center(child: Text('0')),),
        //   const VerticalDivider(color: Colors.black,width: 2,),
        // SizedBox(
        //   child: IconButton(onPressed: (){
        //     widget.onRemove();
        //   }, icon: const Icon(Icons.minimize)),
        // ),
      ],),
    );
  }
}















// class ContactFormItemWidget extends StatelessWidget {
//   final int widgetId;
//   final Function onRemove;
//   const ContactFormItemWidget({Key? key,required this.widgetId,required this.onRemove}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Text('Id : $widgetId'),
//         SizedBox(width: MediaQuery.of(context).size.width*.1,child: TextField(
//           onChanged: (value){
//             // num qtyValue = num.tryParse(value) ?? 0;
//             // var itemInfoCubit = context.read<ItemInfoCubit>();
//             // var mapValue = itemInfoCubit.state.itemInfo;
//             // mapValue[widget.widgetId]!['Qty_${widget.widgetId}'] = qtyValue;
//             // mapValue[widget.widgetId]!['Amount_${widget.widgetId}'] = qtyValue * mapValue[widget.widgetId]!['Price_${widget.widgetId}'];
//             // itemInfoCubit.itemInfoStateUpdate(widgetList: itemInfoCubit.state.widgetList, itemData: mapValue);
//           },
//           decoration: const InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 12),
//             border: OutlineInputBorder(),
//             hintText: "Enter no of Qty",
//             labelText: "Qty",
//           ),
//         ),),
//         SizedBox(width: MediaQuery.of(context).size.width*.1,child: TextField(
//           onChanged: (value){
//             // num qtyValue = num.tryParse(value) ?? 0;
//             // var itemInfoCubit = context.read<ItemInfoCubit>();
//             // var mapValue = itemInfoCubit.state.itemInfo;
//             // mapValue[widget.widgetId]!['Price_${widget.widgetId}'] = qtyValue;
//             // mapValue[widget.widgetId]!['Amount_${widget.widgetId}'] = qtyValue * mapValue[widget.widgetId]!['Qty_${widget.widgetId}'];
//             // itemInfoCubit.itemInfoStateUpdate(widgetList: itemInfoCubit.state.widgetList, itemData: mapValue);
//           },
//           decoration: const InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 12),
//             border: OutlineInputBorder(),
//             hintText: "Enter Price Of Qty",
//             labelText: "Price",
//           ),
//         ),),
//         SizedBox(width: MediaQuery.of(context).size.width*.1,child: TextField(
//           onChanged: (value){
//             // num qtyValue = num.tryParse(value) ?? 0;
//             // var itemInfoCubit = context.read<ItemInfoCubit>();
//             // var mapValue = itemInfoCubit.state.itemInfo;
//             // mapValue[widget.widgetId]!['Disc_${widget.widgetId}'] = qtyValue;
//             // itemInfoCubit.itemInfoStateUpdate(widgetList: itemInfoCubit.state.widgetList, itemData: mapValue);
//           },
//           decoration: const InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 12),
//             border: OutlineInputBorder(),
//             hintText: "Enter Disc (%) per item",
//             labelText: "Disc(%)",
//           ),
//         ),),
//         IconButton(onPressed: (){
//           onRemove();
//         }, icon: const Icon(Icons.minimize)),
//         const SizedBox(width: 50,)
//       ],);
//   }
// }
