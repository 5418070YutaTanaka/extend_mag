abstract class ActionCommand {
  int priority;
  String name;
  abstract void Action(Player player); // 選択したときにおこる行動を指定。
  abstract String getName();
  int getPriority() {
    return priority;
  }
  abstract int getPoint();
}
class AttackAction extends ActionCommand {
  int AttackPoint = int(random(3)) + 4;
  String getName() {
    return "AttackAction";
  }
  void Action(Player player) {
    player.enemy.lifepoint -= AttackPoint;
  }
  int getPoint() {
    return AttackPoint;
  }
}
class DeffenceAction extends ActionCommand {
  String name = "DeffenceAction";
  void Action(Player player) {
    if (player.enemy.NextAction.getName() == "AttackAction") {
      player.lifepoint += player.enemy.NextAction.getPoint();
    }
    player.lifepoint += 1;
  }
  String getName() {
    return "DeffenceAction";
  }
  int getPoint() {
    return 0;

  }
}
class HealAction extends ActionCommand {
  int HealPoint = int(random(3)) + 3;
  int priority = 50;
  public String name = "HealAction";
  void Action(Player player) {
    player.lifepoint += HealPoint;
  }
  String getName() {
    return "HealAction";
  }
  int getPoint() {
    return HealPoint;
  }
}

class CounterAction extends ActionCommand {
  public String name = "CounterAction";
  void Action(Player player){
    ActionCommand e = player.enemy.NextAction;
    player.extra = true;
    if ( e.getName() == "AttackAction"){
      //相手のダメージ分回復
      player.lifepoint += e.getPoint();
      //相手のダメージ分ダメージ
      player.enemy.lifepoint -= e.getPoint();
    }
  }
  String getName(){
    return "Counter Command";
  }
  int getPoint(){
    return 0;
  }
}
class DrainAction extends ActionCommand {
  public String name = "DrainAction";
  void Action(Player player){
    ActionCommand e = player.enemy.NextAction;
    player.extra = true;
    if ( e.getName() == "HealAction"){
      //相手のダメージ分回復
      player.lifepoint += e.getPoint();
      //相手のダメージ分ダメージ
      player.enemy.lifepoint -= e.getPoint();
    }
  }
  String getName(){
    return "Drain Command";
  }
  int getPoint(){
    return 0;
  }
}
class DragonRageAction extends ActionCommand {
  public String name = "DoragonRageAction";
  int damage = 4;
  void Action(Player player){
    player.extra = true;
    player.enemy.lifepoint -= damage;
  }
  String getName(){
    return "DragonRage Command";
  }
  int getPoint(){
    return damage;
  }
}
