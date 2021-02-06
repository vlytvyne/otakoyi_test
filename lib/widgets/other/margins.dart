import 'package:flutter/material.dart';

class VerticalMargin extends StatelessWidget {
	final int margin;

	const VerticalMargin(this.margin, {Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) =>
			SizedBox(height: margin.toDouble());
}

class HorizontalMargin extends StatelessWidget {
	final int margin;

	const HorizontalMargin(this.margin, {Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) =>
			SizedBox(width: margin.toDouble());
}

class SliverVerticalMargin extends StatelessWidget {
	final int margin;

	const SliverVerticalMargin(this.margin, {Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) =>
			SliverToBoxAdapter(
				child: SizedBox(
					height: margin.toDouble()
				)
			);
}

class SliverHorizontalMargin extends StatelessWidget {
	final int margin;

	const SliverHorizontalMargin(this.margin, {Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) =>
			SliverToBoxAdapter(
					child: SizedBox(
						width: margin.toDouble()
					)
			);
}