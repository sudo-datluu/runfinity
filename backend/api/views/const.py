from rest_framework.response import Response
from rest_framework import status

import random
import math
RESPONSE_FORBIDDEN = Response(
    data={
        'msg': 'Fobidden',
        'status': 403
    }, status=status.HTTP_403_FORBIDDEN
)

RESPONSE_NOT_FOUND = Response (
    data={
        'msg': 'Not Found',
        'status': 404
    }, status=status.HTTP_404_NOT_FOUND
)

RESPONSE_NOT_ACCEPTABLE = Response(
    data={
        'msg': 'Not Acceptable',
        'status': 406
    }, status=status.HTTP_406_NOT_ACCEPTABLE
)

def get_bad_request(msg) -> Response:
    return Response(
        {
            'msg': msg,
            'status': 400
        }, status=status.HTTP_400_BAD_REQUEST
    )

def get_random_lat_long_within_range(target_lat, target_long, r=6.66):
    radiusInDegrees = r / 111000
    u = random.random()
    v = random.random()
    w = radiusInDegrees * math.sqrt(u)
    t = 2 * math.pi * v
    x = w * math.cos(t)
    y = w * math.sin(t)
    # Adjust the x-coordinate for the shrinking of the east-west distances
    new_x = x / math.cos(math.radians(target_long))
    new_lat = new_x + target_lat
    new_long = y + target_long
    return new_lat, new_lat