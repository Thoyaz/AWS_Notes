for i in {1..10}; do
  printf -v filename "terraform_%02d.zip" "$i"
  curl -s -o "$filename" https://releases.hashicorp.com/terraform/1.12.1/terraform_1.12.1_darwin_arm64.zip
done
