all: registry
	$(MAKE) publish bundle=one
	$(MAKE) publish bundle=two
	opa run -s -c opa.yaml

publish: $(bundle).tar.gz
	oras push localhost:5000/org/$(bundle):latest \
		--config config.json:application/vnd.oci.image.config.v1+json \
		$<:application/vnd.oci.image.layer.v1.tar+gzip

%.tar.gz: %
	opa build $(BUILD_FLAGS) -o $@ $</

registry:
	docker run --rm --name registry --publish 127.0.0.1:5000:5000 \
		--detach docker.io/library/registry:2
clean:
	docker stop registry
	rm *.tar.gz
