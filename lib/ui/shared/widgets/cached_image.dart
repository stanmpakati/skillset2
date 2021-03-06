import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedNetworkImage(String mediaUrl, {bool isPotifolio = false}) {
  if (mediaUrl != null) {
    return CachedNetworkImage(
      imageUrl: mediaUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Padding(
        padding: EdgeInsets.all(20),
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Icon(
        isPotifolio ? Icons.error : Icons.person,
        color: Colors.red,
      ),
    );
  }
  return isPotifolio
      ? Icon(Icons.person, size: 65, color: Colors.grey[600])
      : Icon(Icons.person, size: 50, color: Colors.grey[600]);
}
