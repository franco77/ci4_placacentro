<?php

namespace App\Controllers\Admin;

use App\Models\Settings_model;
use App\Controllers\Admin\BaseController;
use App\Models\Currency_model;

class Settings extends BaseController
{

    function __construct()
    {
        $this->Settings_model = new Settings_model();
        $this->Currency_model = new Currency_model();
    }

    public function index()
    {
        $data = [
            'controller'        => 'settings',
            'title'             => 'Ajustes',
            'all_currency'      => $this->Currency_model->findAll(),
        ];
        return view('admin/setting/settings', $data);
    }

    public function save_settings()
    {
        $settings = array("siteName", "address", "email", "money", "theme", "phone", "sidebar", "table_style", "date_format", "number_format", "currency_symbol", "file", "table_header_style");
        foreach ($settings as $setting) {
            $value = $this->request->getPost($setting);
            if ($value || $value === "0") {

                $this->Settings_model->save_setting($setting, $value);
            }
        }

        return redirect()->to($_SERVER['HTTP_REFERER']);
    }



    public function upload()
    {



        $validated = $this->validate([
            'file' => [
                'uploaded[file]',
                'mime_in[file,image/jpg,image/jpeg,image/gif,image/png]',
                'max_size[file,4096]',
            ],
        ]);

        $msg = 'Please select a valid file';

        if (!$validated) {
            $msg = 'Eiter file type or size (Max 4MB) not correct.';
        } else {
            $x_file = $this->request->getFile('file');
            $image = \Config\Services::image()
                ->withFile($x_file)
                ->resize(400, 400, true, 'height')
                ->save(FCPATH . '/uploads/logo/' . $x_file->getClientName());
            $x_file->move(WRITEPATH . 'uploads');
            $id = 13;
            $fileData = [
                'value' =>  $x_file->getClientName()
            ];
            $store = $this->Settings_model->update($id, $fileData);
            $msg = 'File has been uploaded';
            return redirect()->to(base_url('admin/settings/index'))->with('msg', $msg);
        }
    }
}
