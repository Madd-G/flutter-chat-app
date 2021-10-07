class Users {
  int id;
  String name;
  String msg;
  String status;
  String dp;
  bool seenMsgs;
  int unreadMsgs;
  String isOnlineTime;
  bool isOnline;
  String missedCalls;

  Users({
    this.id,
    this.name,
    this.msg,
    this.status,
    this.dp,
    this.seenMsgs,
    this.unreadMsgs,
    this.isOnlineTime,
    this.isOnline,
    this.missedCalls
  });
}

List<Users> user = [
  Users(
    id: 1,
    name: 'Alice',
    msg: 'You: meet me at..',
    status: 'Just now',
    dp: 'images/woman_profile.jpg',
    seenMsgs: false,
    isOnlineTime: 'Online',
    isOnline: true,
    missedCalls: '3 Missed Calls',
  ),
  Users(
    id: 2,
    name: 'Zack',
    msg: 'Im on my way ...',
    status: '3 hours ago',
    dp: 'images/profile_image.jpg',
    seenMsgs: true,
    unreadMsgs: 12,
    isOnlineTime: '4 hours ago',
    isOnline: false,
    missedCalls: 'Missed Calls',
  ),
  Users(
    id: 3,
    name: 'Ali',
    msg: 'Ill be fine , see u !!',
    status: '2 days ago',
    dp: 'images/avatar_image.jpg',
    seenMsgs: true,
    unreadMsgs: 3,
    isOnlineTime: '3 days ago',
    isOnline: false,
    missedCalls: 'outgoing Call',

  ),
  Users(
    id: 4,
    name: 'Friend',
    msg: 'You: See you soon',
    status: 'Just now',
    dp: 'images/profile_image.jpg',
    seenMsgs: false,
    isOnlineTime: 'Online',
    isOnline: true,
    missedCalls: 'Missed Calls',

  ),
  Users(
    id: 5,
    name: 'Marie',
    msg: 'Gud Morning',
    status: '23 seconds ago',
    dp: 'images/woman_profile.jpg',
    seenMsgs: false,
    isOnlineTime: 'Online',
    isOnline: true,
    missedCalls: 'Missed Calls',

  ),
  Users(
    id: 6,
    name: 'Sophia',
    msg: 'Ill be fine , see u !!',
    status: '2 days ago',
    dp: 'images/profile_image.jpg',
    seenMsgs: true,
    unreadMsgs: 3,
    isOnlineTime: '3 days ago',
    isOnline: false,
    missedCalls: '2 Missed Calls',

  ),
  Users(
    id: 7,
    name: 'Steven',
    msg: 'Ill be fine , see u !!',
    status: '2 days ago',
    dp: 'images/avatar_image.jpg',
    seenMsgs: false,
    unreadMsgs: 3,
    isOnlineTime: '4 hours ago',
    isOnline: false,
    missedCalls: '3 Missed Calls',

  ),
];
