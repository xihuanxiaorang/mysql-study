
题目来源：[LeetCode 1097 - 游戏玩法分析 V](https://leetcode.cn/problems/game-play-analysis-v/)

## 题目描述

表：`Activity`

```
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
（player_id，event_date）是此表的主键(具有唯一值的列的组合)
这张表显示了某些游戏的玩家的活动情况
每一行表示一个玩家的记录，在某一天使用某个设备注销之前，登录并玩了很多游戏（可能是 0）
```

玩家的 **安装日期** 定义为该玩家的第一个登录日。

我们将日期 x 的 **第一天留存率** 定义为：假定安装日期为 `X` 的玩家的数量为 `N` ，其中在 `X` 之后的一天重新登录的玩家数量为 `M`，`M/N` 就是第一天留存率，**四舍五入到小数点后两位**。

编写解决方案，报告所有安装日期、当天安装游戏的玩家数量和玩家的 **第一天留存率**。

以 **任意顺序** 返回结果表。

结果格式如下所示。

**示例 1：**

```
输入：
Activity 表：
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-01 | 0            |
| 3         | 4         | 2016-07-03 | 5            |
+-----------+-----------+------------+--------------+
输出：
+------------+----------+----------------+
| install_dt | installs | Day1_retention |
+------------+----------+----------------+
| 2016-03-01 | 2        | 0.50           |
| 2017-06-25 | 1        | 0.00           |
+------------+----------+----------------+
解释：
玩家 1 和 3 在 2016-03-01 安装了游戏，但只有玩家 1 在 2016-03-02 重新登录，所以 2016-03-01 的第一天留存率是 1/2=0.50
玩家 2 在 2017-06-25 安装了游戏，但在 2017-06-26 没有重新登录，因此 2017-06-25 的第一天留存率为 0/1=0.00
```
## SQL Schema

```sql
Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-01', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');
```