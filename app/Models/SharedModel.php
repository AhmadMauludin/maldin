<?php
// if this line is still there, it means I just copy paste my friend's UKK application
namespace App\Models;

use CodeIgniter\Model;

class SharedModel extends Model
{
    protected $table = 'shared';
    protected $primaryKey = 'id';
    protected $allowedFields = ['idtugas', 'sharedto', 'sharedby', 'accepted', 'shareddate', 'acceptdate'];
}
