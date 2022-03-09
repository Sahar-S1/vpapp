import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PageTemplate extends StatefulWidget {
  final String? header;
  final Widget Function({required String title, required Widget child})
      parentBuilder;
  final Widget Function(ScrollController scrollController) childBuilder;

  const PageTemplate({
    Key? key,
    this.header,
    required this.parentBuilder,
    required this.childBuilder,
  }) : super(key: key);

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isOpen = panelController.isAttached && panelController.isPanelOpen;
    String appBarTitle = isOpen ? widget.header ?? '' : '';

    return widget.parentBuilder(
      title: appBarTitle,
      child: SlidingUpPanel(
        controller: panelController,
        onPanelOpened: () => setState(() {}),
        onPanelClosed: () => setState(() {}),
        backdropEnabled: true,
        backdropOpacity: 0.1,
        parallaxEnabled: true,
        parallaxOffset: .5,
        minHeight: .7 * MediaQuery.of(context).size.height,
        maxHeight: .9 * MediaQuery.of(context).size.height,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
        isDraggable: widget.header != null,
        defaultPanelState:
            widget.header == null ? PanelState.OPEN : PanelState.CLOSED,
        body: isOpen
            ? null
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Text(
                    widget.header ?? '',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.appBarTheme.foregroundColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
        panelBuilder: (sc) => SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              top: 0,
              left: 16,
              right: 16,
              bottom: 0,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12.0),
              ),
              color: theme.colorScheme.primaryContainer,
            ),
            child: Column(
              children: [
                if (widget.header != null) const SizedBox(height: 12.0),
                if (widget.header != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 18.0),
                Expanded(child: widget.childBuilder(sc)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
