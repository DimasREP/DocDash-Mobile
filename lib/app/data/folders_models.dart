class Folders {
  int? id;
  int? userId;
  String? folderName;
  String? createdAt;
  String? updatedAt;

  Folders(
      {this.id, this.userId, this.folderName, this.createdAt, this.updatedAt});

  Folders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    folderName = json['FolderName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['FolderName'] = this.folderName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
