import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class TabItemComponent extends Component<TabItemState> {
  TabItemComponent()
    : super(
      view: buildView,
      dependencies: Dependencies<TabItemState>(
          adapter: null,
          slots: <String, Dependent<TabItemState>>{
          }),);

}
