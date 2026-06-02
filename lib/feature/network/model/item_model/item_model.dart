import 'package:equatable/equatable.dart';

import 'item.dart';

class ItemModel extends Equatable {
	final List<Item>? items;

	const ItemModel({this.items});

	factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
				items: (json['items'] as List<dynamic>?)
						?.map((e) => Item.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'items': items?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [items];
}
